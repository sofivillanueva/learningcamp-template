# frozen_string_literal: true

module RS
  module Logo
    class Component < ViewComponent::Base
      attr_reader :src, :alt

      def initialize(src:, alt:)
        super
        @src = src
        @alt = alt
      end
    end
  end
end
