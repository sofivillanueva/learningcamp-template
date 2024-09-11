# frozen_string_literal: true

module RS
  module List
    module Row
      class Component < ViewComponent::Base
        attr_reader :row_values, :actions

        def initialize(row_values: [{ value: 'row 1', label: 'success' },
                                    { value: 'row 2', label: 'error' },
                                    { value: 'row 3' }],
                       actions: [{ name: 'edit', url: '#' }, { name: 'remove', url: '#' }])
          super
          @row_values = row_values
          @actions = actions
        end

        def label_class_color(label)
          "bg-#{label}-50 text-#{label}-700 ring-#{label}-600/20"
        end
      end
    end
  end
end
