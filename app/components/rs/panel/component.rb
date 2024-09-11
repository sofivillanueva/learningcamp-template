# frozen_string_literal: true

module RS
  module Panel
    class Component < ViewComponent::Base
      renders_one :body

      def controller
        'rs--panel--component'
      end
    end
  end
end
