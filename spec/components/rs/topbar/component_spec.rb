# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Topbar display', type: :system do
  let(:user) { create(:user, email: 'user@example.com', password: 'password') }

  describe 'Topbar content and interactions' do
    before do
      login_as(user, scope: :user)
      visit '/'
    end

    it 'displays the notifications icon' do
      expect(page).to have_css('svg')
    end
  end
end
