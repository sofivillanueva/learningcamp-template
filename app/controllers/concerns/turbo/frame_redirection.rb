# frozen_string_literal: true

module Turbo
  module FrameRedirection
    extend ActiveSupport::Concern

    # This is a hack until Turbo gives a proper way to break out from Turbo Frames
    # depending on the response. Normally in Rails apps, you'd render errors
    # in the same Turbo Frame, but redirect the _top (main) Frame on success.
    def redirect_to(url = {}, options = {})
      super.tap do
        if turbo_frame_request?
          self.status = 200
          self.response_body = render_to_string(turbo_stream: turbo_stream.action(:redirect, location))
        end
      end
    end
  end
end
