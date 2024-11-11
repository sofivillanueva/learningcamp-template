# frozen_string_literal: true

class ValidatePreferencesPerUser
  def initialize(user_id)
    @user = User.find_by(id: user_id)
  end

  def call
    check_valid_amount_of_preferences
  end

  private

  def check_valid_amount_of_preferences
    is_valid = false
    is_valid = true if @user.preferences.size < 5
    is_valid
  end
end
