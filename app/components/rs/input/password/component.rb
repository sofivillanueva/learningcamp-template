# frozen_string_literal: true

module RS
  module Input
    module Password
      class Component < Text::Component
        def initialize(**kwargs)
          super(**kwargs.merge(type: :password, controller:))
        end

        def controller
          'rs--input--password--component'
        end
      end
    end
  end
end
