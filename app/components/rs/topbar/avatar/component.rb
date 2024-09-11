# frozen_string_literal: true

module RS
  module Topbar
    module Avatar
      class Component < ViewComponent::Base
        AVATAR_COLORS = %w[bg-primary-500 bg-secondary-500 bg-neutral-500 bg-success-500 bg-error-500
                           bg-warning-500].freeze

        def initialize(user_id:, first_name:, last_name:)
          super
          @user_id = user_id
          @first_name = first_name
          @last_name = last_name
        end

        def avatar_initials
          [@first_name, @last_name].compact.map(&:first).join.upcase
        end

        def avatar_color
          AVATAR_COLORS[@user_id % AVATAR_COLORS.size]
        end
      end
    end
  end
end
