require 'rails_helper'

RSpec.describe 'Preference creation' do
    # tendria que poner un usuario logueado? Si

    let(:admin_user) { create(:user, email: 'admin@test.com', password: '123123123') }
    let(:new_user_data) do
      { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'user@test.com' }
    end
  
    before do
      login_as(admin_user, scope: :user)
    end

    let(:new_preference_data) do
      { name: 'Lacteos', description: 'No lacteos', restriction: true }
    end
  
    def create_preference(data = new_preference_data)
      visit '/preferences'
      click_on 'New Preference'
      fill_in 'Name', with: data[:name]
      fill_in 'Description', with: data[:description]
      fill_in 'Restriction', with: data[:restriction]
      click_on 'Create Preference'
    end
  
    context 'with valid data' do
      it 'creates a new preference' do
        create_preference
  
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