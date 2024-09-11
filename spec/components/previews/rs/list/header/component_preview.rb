# frozen_string_literal: true

module RS
  module List
    module Header
      class ComponentPreview < ViewComponent::Preview
        def standard(column_names: %w[column1 column2 column3])
          render ::RS::List::Header::Component.new(column_names:)
        end
      end
    end
  end
end
