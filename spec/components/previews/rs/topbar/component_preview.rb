# frozen_string_literal: true

module RS
  module Topbar
    class ComponentPreview < ViewComponent::Preview
      # @param user_id number
      # @param first_name text
      # @param last_name text
      def standard(user_id: 1, first_name: 'John', last_name: 'Doe')
        render(RS::Topbar::Component.new(user_id:, first_name:, last_name:))
      end
    end
  end
end
