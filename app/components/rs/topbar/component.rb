# frozen_string_literal: true

module RS
  module Topbar
    class Component < ViewComponent::Base
      def initialize(user_id:, first_name:, last_name:)
        super
        @user_id = user_id
        @first_name = first_name
        @last_name = last_name
      end

      def controller
        'rs--topbar--component'
      end
    end
  end
end
