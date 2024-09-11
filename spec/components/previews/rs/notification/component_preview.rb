# frozen_string_literal: true

module RS
  module Notification
    class ComponentPreview < ViewComponent::Preview
      # Simple notification
      # ---------------
      # This is simple notification.
      #
      # @param key select [notice, alert]
      # @param message text
      # Example:
      # ```
      # <%= render RS::Notification::Component.new(
      #   key: :notice,
      #   message: 'This is a message'
      # ) %>
      # ```
      def default(key: 'notice', message: 'This is a message')
        render RS::Notification::Component.new(
          key:,
          message:
        )
      end
    end
  end
end
