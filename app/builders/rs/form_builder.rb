# frozen_string_literal: true

module RS
  class FormBuilder < ActionView::Helpers::FormBuilder
    def self.detect_field(attribute)
      field_type = case attribute.column_name
                   when :email then :email
                   when :password then :password
                   end

      return field_type if field_type

      case attribute.type
      when :date, :time, :datetime, :timestamp then :select
      else
        :text
      end
    end

    def field(method, options = {})
      error_messages = @object.errors.full_messages_for(method)&.join(', ')
      RS::InputGroup::Component.new(error: error_messages).render_in(@template) do |component|
        options[:value] = @object.try(method)
        component.with_label(text: options.delete(:label))
        component.public_send(
          :"with_#{options.delete(:as)}_field",
          name: field_name(method, multiple: options[:multiple], index: options[:index]),
          **options
        )
      end
    end

    def submit(options = {})
      RS::Button::Component.new(type: :submit, **options).render_in(@template)
    end

    def checkbox(options = {})
      RS::Checkbox::Component.new(**options).render_in(@template)
    end
  end
end
