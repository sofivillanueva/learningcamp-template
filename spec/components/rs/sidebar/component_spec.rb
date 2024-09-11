# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sidebar display', type: :system do
  let(:user) { create(:user, email: 'user@example.com', password: 'password') }

  describe 'for desktop' do
    before { set_desktop_resolution }

    it 'displays the sidebar after the user logs in' do
      login_as(user, scope: :user)
      visit '/'

      expect(page).to have_content('Dashboard')
    end
  end

  describe 'for mobile' do
    before { set_mobile_resolution }

    it 'does not display the sidebar after the user logs in' do
      login_as(user, scope: :user)
      visit '/'

      expect(page).to have_no_css('svg.dashboard-icon')
    end
  end
end
