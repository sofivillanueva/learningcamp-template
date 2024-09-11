# frozen_string_literal: true

module RS
  module Sidebar
    module Section
      class Component < ViewComponent::Base
        def initialize(items:)
          super()
          @items = items
        end

        def highlight_link(item)
          'bg-primary-700' if request.path == item[:link]
        end
      end
    end
  end
end
