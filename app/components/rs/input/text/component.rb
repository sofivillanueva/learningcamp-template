# frozen_string_literal: true

module RS
  module Input
    module Text
      class Component < ViewComponent::Base
        attr_accessor :id, :data

        def initialize(name:, type: 'text', required: false, id: nil, autocomplete: nil,
                       placeholder: nil, controller: nil, value: nil, data: [], disabled: false,
                       with_left_icon: false)
          super
          @id = id || "#{SecureRandom.uuid}-#{Time.current.to_i}"
          @name = name
          @type = type
          @required = required
          @autocomplete = autocomplete
          @placeholder = placeholder
          @controller = controller
          @value = value
          @data = data
          @disabled = disabled
          @with_left_icon = with_left_icon
        end

        def target
          return if @controller.blank?

          "data-#{@controller}-target='input'"
        end

        def data_attributes
          data.map { |data_attr| "data-#{data_attr}" }.join(' ')
        end
      end
    end
  end
end
