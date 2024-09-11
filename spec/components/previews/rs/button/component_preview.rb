# frozen_string_literal: true

module RS
  module Button
    class ComponentPreview < ViewComponent::Preview
      # @param text text required
      # @param type select [button, submit, reset]
      # @param disabled toggle
      def standard(text: 'Button text', type: 'button', disabled: false)
        render RS::Button::Component.new(
          text:,
          type:,
          disabled:
        )
      end
    end
  end
end
