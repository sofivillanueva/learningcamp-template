# frozen_string_literal: true

module RS
  module Checkbox
    class ComponentPreview < ViewComponent::Preview
      # @param id text
      # @param name text
      # @param label text
      # @param checked toggle
      #
      # Link ViewComponent
      # ------------
      # Creates a standard checkbox component with the given identifier, name, label and checked.
      # Example:
      #
      # <%= render RS::Checkbox::Component.new(id: 'remember', name: 'remember', label: 'Remember me') %>
      def standard(id: 'remember', name: 'name', label: 'Remember me', checked: false)
        render RS::Checkbox::Component.new(
          id:,
          name:,
          label:,
          checked:
        )
      end
    end
  end
end
