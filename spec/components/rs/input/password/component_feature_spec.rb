# frozen_string_literal: true

RSpec.describe RS::Input::Password::Component, type: :feature do
  feature 'Password visibility button', :js do
    scenario 'Show password when button is pressed' do
      visit('/rails/view_components/rs/input/password/component/standard')

      expect(page).to have_field(type: 'password')

      find_by_id('password-reveal-button').click

      expect(page).to have_field(type: 'text')
    end
  end
end
