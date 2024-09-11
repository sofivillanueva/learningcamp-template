# frozen_string_literal: true

module RS
  module Logo
    class ComponentPreview < ViewComponent::Preview
      def default
        render(RS::Logo::Component.new(src: 'icons/mark_dark.svg', alt: 'Your Company'))
      end
    end
  end
end
