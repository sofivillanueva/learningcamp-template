# frozen_string_literal: true

class PreferencesController < ApplicationController
  def index
    @preferences = current_user.preferences
    @pagy, @records = pagy(@preferences)
  end

  def create
    @preference = PreferenceForm.new(args: user_form_params)

    if @user.valid?
      @user.save!
      redirect_to users_path, notice: t('views.users.create_success')
    else
      render :new, status: :unprocessable_entity
    end
  end
end
