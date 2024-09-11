# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]

  def index
    @users = User.all
    @pagy, @records = pagy(@users)
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = UserForm.new(args: user_form_params)

    if @user.valid?
      @user.save!
      redirect_to users_path, notice: t('views.users.create_success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = UserForm.new(args: user_form_params, user_id: params[:id])
    if @user.save
      redirect_to users_path, notice: t('views.users.update_success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy!
      redirect_to users_path, notice: t('views.users.destroy_success')
    else
      redirect_to users_path, alert: t('views.users.destroy_failure')
    end
  end

  private

  def user_form_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end

  def user_params
    user_form_params
  end

  def set_user
    @user = User.find(params[:id])
  end
end
