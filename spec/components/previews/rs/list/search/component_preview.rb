# frozen_string_literal: true

module RS
  module List
    module Search
      class ComponentPreview < ViewComponent::Preview
        def standard(url: 'users_path')
          render ::RS::List::Search::Component.new(url:)
        end
      end
    end
  end
end
