# frozen_string_literal: true

module RS
  module Label
    class Component < ViewComponent::Base
      attr_writer :html_for

      def initialize(text:, html_for: nil)
        super
        @text = text
        @html_for = html_for
      end
    end
  end
end
