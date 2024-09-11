# frozen_string_literal: true

module RS
  module List
    module Pagination
      class ComponentPreview < ViewComponent::Preview
        def standard(
          next_url: '#',
          previous_url: '#',
          to: 1,
          from: 2,
          count: 2,
          series_with_url: [{ item: 1, url: '#' }, { item: 2, url: '#' }],
          current_page: 2
        )

          render ::RS::List::Pagination::Component.new(next_url:, previous_url:, to:, from:, count:,
                                                       series_with_url:, current_page:)
        end
      end
    end
  end
end
