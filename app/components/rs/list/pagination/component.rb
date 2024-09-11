# frozen_string_literal: true

module RS
  module List
    module Pagination
      class Component < ViewComponent::Base
        attr_reader :next_url, :previous_url, :to, :from, :count, :series_with_url, :current_page

        def initialize(next_url:, previous_url:, to:, from:, count:, series_with_url:, current_page:)
          super
          @next_url = next_url
          @previous_url = previous_url
          @to = to
          @from = from
          @count = count
          @series_with_url = series_with_url
          @current_page = current_page
        end
      end
    end
  end
end
