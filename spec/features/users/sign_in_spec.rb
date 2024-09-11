# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sign_in_page', :js do
  feature 'sign_in' do
    let!(:user) { create(:user, email: 'test@test.com', password:) }
    let(:password) { '123123123' }

    scenario 'validation errors' do
      visit root_path

      expect(page).to have_content('Log in')

      fill_in 'Email address', with: 'bob@example.com'
      fill_in 'Password', with: 'foobar'

      click_on 'Log in'
      expect(page).to have_text('Invalid Email or password.')
    end

    scenario 'succeful sign_in' do
      visit root_path

      expect(page).to have_content('Log in')

      fill_in 'Email address', with: user.email
      fill_in 'Password', with: password

      click_on 'Log in'
      expect(page).to have_text('Signed in successfully.')
    end
  end
end
