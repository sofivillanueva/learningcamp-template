# frozen_string_literal: true

module RS
  module Input
    module Text
      class ComponentPreview < ViewComponent::Preview
        # @param name text
        # @param value text
        # @param required toggle
        # @param autocomplete text
        # @param placeholder text
        def standard(name: 'text', value: nil, required: false, autocomplete: nil, placeholder: nil)
          render ::RS::Input::Text::Component.new(
            name:, value:, type: 'text', required:, autocomplete:, placeholder:
          )
        end
      end
    end
  end
end
