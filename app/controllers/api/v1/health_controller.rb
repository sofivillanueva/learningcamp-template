# frozen_string_literal: true

module API
  module V1
    class HealthController < API::V1::APIController
      skip_before_action :authenticate_user!

      def status
        render json: { online: true }
      end
    end
  end
end
