# frozen_string_literal: true

module RS
  module Input
    module Select
      class Component < Text::Component
        attr_reader :items

        def initialize(items: {}, multiple: false, **kwargs)
          super(**kwargs.merge(type: :select))

          @items = items
          @multiple = multiple
        end
      end
    end
  end
end
