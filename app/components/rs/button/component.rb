# frozen_string_literal: true

module RS
  module Button
    class Component < ViewComponent::Base
      attr_reader :type, :disabled

      def initialize(text:, type: 'button', disabled: false)
        super()
        @text = text
        @type = type
        @disabled = disabled
      end
    end
  end
end
