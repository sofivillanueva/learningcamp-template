# frozen_string_literal: true

module RS
  module List
    module Search
      class Component < ViewComponent::Base
        attr_accessor :url

        def initialize(url: '')
          super
          @url = url
        end
      end
    end
  end
end
