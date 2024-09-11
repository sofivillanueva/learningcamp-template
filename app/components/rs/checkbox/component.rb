# frozen_string_literal: true

module RS
  module Checkbox
    class Component < ViewComponent::Base
      attr_reader :id, :name, :label, :checked

      def initialize(name:, label:, id: nil, checked: false, disabled: false)
        super
        @id = id
        @name = name
        @label = label
        @checked = checked
        @disabled = disabled
      end

      def checked?
        @checked ? 'checked' : ''
      end
    end
  end
end
