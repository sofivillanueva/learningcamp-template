# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User creation' do
  let(:admin_user) { create(:user, email: 'admin@test.com', password: '123123123') }
  let(:new_user_data) do
    { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'user@test.com' }
  end

  before do
    login_as(admin_user, scope: :user)
  end

  def create_user(data = new_user_data)
    visit '/users'
    click_on 'New User'
    fill_in 'Name', with: data[:first_name]
    fill_in 'Last Name', with: data[:last_name]
    fill_in 'Email', with: data[:email]
    click_on 'Create User'
  end

  context 'with valid data' do
    it 'creates a new user' do
      create_user

      expect(page).to have_content(I18n.t('views.users.create_success'))
    end
  end

  context 'with invalid data' do
    it 'handles invalid user data' do
      new_user_data[:email] = 'admin@test.com'
      create_user(new_user_data)

      expect(find('input[name="user[first_name]"]').value).to eq(new_user_data[:first_name])
      expect(find('input[name="user[last_name]"]').value).to eq(new_user_data[:last_name])
      expect(find('input[name="user[email]"]').value).to eq(new_user_data[:email])
      expect(page).to have_content('Email has already been taken')
    end
  end

  context 'when navigation' do
    it 'returns the correct path after click on cancel button' do
      new_user_data[:email] = 'admin@test.com'
      create_user(new_user_data)

      click_on 'Cancel'
      expect(page).to have_current_path('/users')
    end

    it 'returns the correct path after click on New User button' do
      visit '/users'
      click_on 'New User'
      expect(page).to have_current_path('/users/new')
    end
  end
end
