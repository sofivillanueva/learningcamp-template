# frozen_string_literal: true

module RS
  module Input
    module Password
      class ComponentPreview < ViewComponent::Preview
        # @param name text
        # @param required toggle
        # @param autocomplete text
        # @param placeholder text
        def standard(name: 'password', required: false, autocomplete: nil, placeholder: nil)
          render ::RS::Input::Password::Component.new(
            name:, required:, autocomplete:, placeholder:
          )
        end
      end
    end
  end
end
