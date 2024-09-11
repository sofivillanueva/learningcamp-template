# frozen_string_literal: true

module RS
  module Input
    module Email
      class ComponentPreview < ViewComponent::Preview
        # @param name text
        # @param required toggle
        # @param autocomplete text
        # @param placeholder text
        def standard(name: 'email', required: false, autocomplete: nil, placeholder: nil)
          render ::RS::Input::Email::Component.new(
            name:, required:, autocomplete:, placeholder:
          )
        end
      end
    end
  end
end
