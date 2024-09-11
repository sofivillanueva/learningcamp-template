# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', :js do
  feature 'Home page' do
    context 'when authenticated' do
      let!(:user) { create(:user, email: 'test@test.com', password:) }
      let(:password) { '123123123' }

      before do
        login_as(user, scope: :user)
        visit '/'
      end

      scenario 'shows the word dashboard' do
        visit root_path
        expect(page).to have_content('Dashboard')
      end
    end

    context 'when not authenticated' do
      scenario 'shows the login page' do
        visit root_path
        expect(page).to have_content('Log in')
      end
    end
  end
end
