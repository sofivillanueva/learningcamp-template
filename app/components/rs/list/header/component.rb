# frozen_string_literal: true

module RS
  module List
    module Header
      class Component < ViewComponent::Base
        attr_reader :column_names, :actions

        def initialize(column_names:, actions: true)
          super
          @column_names = column_names
          @actions = actions
        end
      end
    end
  end
end
