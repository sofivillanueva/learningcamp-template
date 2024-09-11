# frozen_string_literal: true

module RS
  module List
    module Row
      class ComponentPreview < ViewComponent::Preview
        def standard(row_values: [{ value: 'row 1', label: 'success' },
                                  { value: 'row 2', label: 'error' },
                                  { value: 'row 3' }],
                     actions: [
                       { name: 'edit', url: '#' },
                       { name: 'remove', url: '#' }
                     ])
          render ::RS::List::Row::Component.new(row_values:, actions:)
        end
      end
    end
  end
end
