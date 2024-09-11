# frozen_string_literal: true

module RS
  module Input
    module Select
      class ComponentPreview < ViewComponent::Preview
        ITEMS = [
          { value: '1', description: 'First option' },
          { value: '2', description: 'Second option' }
        ].freeze

        # @param name text
        # @param required toggle
        # @param autocomplete text
        # @param placeholder text
        def standard(name: 'select', required: false, autocomplete: nil, placeholder: 'Select an option', items: ITEMS)
          render ::RS::Input::Select::Component.new(
            name:, type: 'select', required:, autocomplete:, placeholder:, items:
          )
        end
      end
    end
  end
end
