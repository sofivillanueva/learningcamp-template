# frozen_string_literal: true

module RS
  module List
    module Info
      class ComponentPreview < ViewComponent::Preview
        # @param title text
        # @param description text
        # @param url text
        # @param text text
        # @param target text

        def standard(title: 'Some Title', description: 'Some Description', url: '#', text: 'Text', target: 'Target')
          render ::RS::List::Info::Component.new(title:, description:, url:, text:, target:)
        end
      end
    end
  end
end
