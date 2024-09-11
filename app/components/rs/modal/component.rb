# frozen_string_literal: true

module RS
  module Modal
    class Component < ViewComponent::Base
      renders_one :body

      def controller
        'rs--modal--component'
      end
    end
  end
end
