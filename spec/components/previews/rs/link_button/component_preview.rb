# frozen_string_literal: true

module RS
  module LinkButton
    class ComponentPreview < ViewComponent::Preview
      # Example:
      # ```
      # <%= render RS::LinkButton::Component.new(
      #   url: 'http://example.com',
      #   text: 'Click here'
      # ) %>
      # ```
      def default(text: 'Click here', url: '#')
        render(RS::LinkButton::Component.new(text:, url:))
      end

      def soft(text: 'Click here', url: '#', variant: :soft)
        render(RS::LinkButton::Component.new(text:, url:, variant:))
      end
    end
  end
end
