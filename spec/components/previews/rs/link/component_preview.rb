# frozen_string_literal: true

module RS
  module Link
    class ComponentPreview < ViewComponent::Preview
      # Primary Link
      # ---------------
      # This is the link style you should use for most things.
      #
      # @param text text
      # @param url text
      # @param color select { choices: [primary, gray] }
      # Example:
      # ```
      # <%= render RS::Link::Component.new(
      #   url: 'http://example.com',
      #   text: 'Click here',
      #   color: 'primary'
      # ) %>
      # ```
      def default(text: 'Click here', url: '#', color: 'primary')
        render RS::Link::Component.new(
          text:,
          url:,
          color:
        )
      end

      # Gray link
      # ---------------
      # Gray link style.
      #
      # @param text text
      # @param url text
      # @param color select { choices: [primary, gray] }
      # @param method text
      # Example:
      # ```
      # <%= render RS::Link::Component.new(
      #   url: 'http://example.com',
      #   text: 'Sign out',
      #   color: 'gray',
      #   method:'delete'
      # ) %>
      # ```
      def gray(text: 'Sign out', url: '#', color: 'gray', method: 'delete')
        render RS::Link::Component.new(
          text:,
          url:,
          color:,
          method:
        )
      end
    end
  end
end
