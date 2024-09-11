# frozen_string_literal: true

module RS
  module Label
    class ComponentPreview < ViewComponent::Preview
      # @param text text
      # @param html_for text
      def standard(text: 'Test', html_for: nil)
        render ::RS::Label::Component.new(
          text:, html_for:
        )
      end
    end
  end
end
