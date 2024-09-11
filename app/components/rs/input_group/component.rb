# frozen_string_literal: true

module RS
  module InputGroup
    class Component < ViewComponent::Base
      def self.input_types
        RS::Input.constants.to_h do |klass|
          type = klass.to_s.downcase
          [type, { renders: lambda do |**kwargs|
            "RS::Input::#{klass}::Component".constantize.new(**additional_input_args(**kwargs))
          end, as: "#{type}_field" }]
        end
      end

      renders_one :label, lambda { |**kwargs|
        RS::Label::Component.new(**kwargs.merge(html_for: @field_id))
      }
      renders_one :field, types: input_types

      def initialize(error: nil)
        super
        @error = error
        @field_id = "#{SecureRandom.uuid}-#{Time.current.to_i}"
      end

      private

      def additional_input_args(**kwargs)
        kwargs[:data] ||= []
        kwargs[:data].push(
          'rs--input-group--component-target=input',
          'action=blur->rs--input-group--component#clearErrors'
        )
        kwargs.merge(id: @field_id)
      end
    end
  end
end
