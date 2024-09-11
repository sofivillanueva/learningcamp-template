# frozen_string_literal: true

module RS
  module Sidebar
    class Component < ViewComponent::Base
      renders_many :sections, RS::Sidebar::Section::Component

      def controller
        'rs--sidebar--component'
      end
    end
  end
end
