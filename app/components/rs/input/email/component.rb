# frozen_string_literal: true

module RS
  module Input
    module Email
      class Component < Text::Component
        def initialize(**kwargs)
          super(**kwargs.merge(type: :email))
        end
      end
    end
  end
end
