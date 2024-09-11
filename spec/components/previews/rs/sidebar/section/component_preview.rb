# frozen_string_literal: true

module RS
  module Sidebar
    module Section
      class ComponentPreview < ViewComponent::Preview
        def standard(items: [{ icon: 'icons/home.svg', name: 'Dashboard', link: '#' }])
          render ::RS::Sidebar::Section::Component.new(items:)
        end
      end
    end
  end
end
