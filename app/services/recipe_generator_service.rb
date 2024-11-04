# frozen_string_literal: true

class RecipeGeneratorService
  attr_reader :message, :user

  OPENAI_TEMPERATURE = ENV.fetch('OPENAI_TEMPERATURE', 0).to_f
  OPENAI_MODEL = ENV.fetch('OPENAI_MODEL', 'gpt-4')

  def initialize(message, user_id)
    @message = message
    @user = User.find(user_id)
  end

  def call
    check_valid_message_length
    response = message_to_chat_api
    create_recipe(response)
  end

  private

  def check_valid_message_length
    error_msg = I18n.t('api.errors.invalid_message_length')
    raise RecipeGeneratorServiceError, error_msg unless !!(message =~ /\b\w+\b/)
  end

  def message_to_chat_api
    openai_client.chat(parameters: {
                         model: OPENAI_MODEL,
                         messages: request_messages,
                         temperature: OPENAI_TEMPERATURE
                       })
  end

  def request_messages
    system_message + new_message
  end

  def system_message
    [{ role: 'system', content: prompt }]
  end

  def prompt
    <<~CONTENT
      You are a recipe generator. Using the ingredients provided and others that you may need, and taking into account (strictly) the user preferences (#{@user_preference}), generate a recipe in JSON format. The response should contain only the following JSON structure:

      {
        "name": "name_of_the_dish",
        "content": "each_step"
      }

      IMPORTANT:
      The entire response is valid JSON without any escape characters.
      The recipe content follows a step-by-step numbered format, each step prefixed with a number.
      Add a line break after each step.
      Always traslate the response to the language of the ingredients provided (mostly Spanish, could be English).
    CONTENT
  end

  def new_message
    [
      { role: 'user', content: "Ingredients: #{message}" }
    ]
  end

  def openai_client
    OpenAI.configure do |config|
      config.access_token = ENV.fetch('OPENAI_API_KEY')
    end
    @openai_client ||= OpenAI::Client.new
  end

  def create_recipe(response)
    parsed_response = response.is_a?(String) ? JSON.parse(response) : response
    content = JSON.parse(parsed_response.dig('choices', 0, 'message', 'content'))

    Recipe.new(name: content['name'], description: content['content'], ingredients: message, user:)
  rescue JSON::ParserError => exception
    raise RecipeGeneratorServiceError, exception.message
  end
end
