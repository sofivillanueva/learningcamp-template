# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  include Turbo::FrameRedirection
  include Pagy::Backend

  before_action :authenticate_user!, unless: -> { devise_controller? || active_admin_controller? }
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  def active_admin_controller?
    is_a?(ActiveAdmin::BaseController)
  end

  def redirect_to_root
    redirect_to(root_path, alert: I18n.t('controllers.application.unauthorized'))
  end
end
