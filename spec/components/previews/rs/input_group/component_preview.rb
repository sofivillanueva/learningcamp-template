# frozen_string_literal: true

module RS
  module InputGroup
    class ComponentPreview < ViewComponent::Preview
      # @param label text
      # @param field_type select :input_types
      # @param error text

      def standard(label: 'Test', field_type: 'text', error: nil)
        render ::RS::InputGroup::Component.new(error:) do |component|
          component.with_label(text: label)
          component.send(
            slot_method_name(field_type).to_sym,
            name: 'input_name'
          )
        end
      end

      private

      def input_types
        %i[
          text
          email
          password
          file
        ]
      end

      def slot_method_name(type)
        "with_#{type}_field"
      end
    end
  end
end
