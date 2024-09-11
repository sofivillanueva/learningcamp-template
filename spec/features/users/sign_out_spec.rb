# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sign_out' do
  feature 'sign_out', :js do
    let(:password) { '123123123' }
    let!(:user) { create(:user, email: 'test@test.com', password:) }

    scenario 'succesful sign_in' do
      login_as(user, scope: :user)

      visit('/')

      find_by_id('user-menu-button').click

      click_on 'Sign out'

      expect(page).to have_content('Signed out successfully.')
    end
  end
end
