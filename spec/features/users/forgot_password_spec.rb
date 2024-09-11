# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'forgot_password' do
  feature 'forgot password' do
    let!(:user) { create(:user, email: 'test@test.com', password: '123123123') }

    scenario 'reset your password' do
      visit root_path

      expect(page).to have_content('Forgot your password?')

      click_on 'Forgot your password?'
      expect(page).to have_text("Enter your email and we'll send you a link to reset your password.")
    end

    scenario 'not found email' do
      visit root_path
      click_on 'Forgot your password?'

      fill_in 'Email address', with: 'test@test1.com'

      click_on 'Send link to email'
      expect(page).to have_text('not found')
    end

    scenario 'succeful forgot password' do
      visit root_path
      click_on 'Forgot your password?'

      fill_in 'Email address', with: user.email

      click_on 'Send link to email'
      expect(page).to have_current_path('/users/sign_in')
      text = 'You will receive an email with instructions on how to reset your password in a few minutes.'
      expect(page).to have_text(text)
    end
  end
end
