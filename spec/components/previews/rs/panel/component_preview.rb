# frozen_string_literal: true

module RS
  module Panel
    class ComponentPreview < ViewComponent::Preview
      def default
        render(RS::Panel::Component.new)
      end
    end
  end
end
