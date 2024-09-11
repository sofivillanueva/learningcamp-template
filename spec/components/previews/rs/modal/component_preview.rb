# frozen_string_literal: true

module RS
  module Modal
    class ComponentPreview < ViewComponent::Preview
      def default
        render(RS::Modal::Component.new)
      end
    end
  end
end
