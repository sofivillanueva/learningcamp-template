# frozen_string_literal: true

module RS
  module Sidebar
    class ComponentPreview < ViewComponent::Preview
      def standard
        render ::RS::Sidebar::Component.new
      end
    end
  end
end
