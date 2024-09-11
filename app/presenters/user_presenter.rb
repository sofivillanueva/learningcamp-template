# frozen_string_literal: true

class UserPresenter
  attr_reader :user

  delegate_missing_to :user

  def initialize(user)
    @user = user
  end
end
