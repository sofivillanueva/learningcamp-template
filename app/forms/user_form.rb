# frozen_string_literal: true

class UserForm < ApplicationForm
  attr_reader :user_id
  attr_accessor :id, :email, :first_name, :last_name

  def initialize(args: {}, user_id: nil)
    super(args)

    @user_id = user_id
    @models = [user].flatten
  end

  def model_name
    User.model_name
  end

  private

  def user
    @user ||= User.find_or_initialize_by(id: user_id) { |it|
      it.password = Devise.friendly_token[0, 20]
    }.tap do |it|
      it.assign_attributes(user_attributes)
    end
  end

  def user_attributes
    { email:, first_name:, last_name: }
  end
end
