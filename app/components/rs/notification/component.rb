# frozen_string_literal: true

module RS
  module Notification
    class Component < ViewComponent::Base
      attr_reader :key, :message

      COLORS = {
        notice: 'text-success-400',
        alert: 'text-error-400'
      }.freeze

      def initialize(key:, message:)
        super
        @key = key
        @message = message
        @html_class = COLORS[key.to_sym]
      end

      def controller
        'rs--notification--component'
      end
    end
  end
end
