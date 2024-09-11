# frozen_string_literal: true

module Helpers
  # Helper method to parse a response
  #
  # @return [Hash]
  def json
    JSON.parse(response.body).with_indifferent_access
  end

  def auth_headers
    user.create_new_auth_token
  end

  def set_desktop_resolution
    page.driver.browser.manage.window.resize_to(1920, 1080)
  end

  def set_mobile_resolution
    page.driver.browser.manage.window.resize_to(375, 667)
  end
end
