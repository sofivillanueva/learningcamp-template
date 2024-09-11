# frozen_string_literal: true

RSpec.describe RS::InputGroup::Component, type: :feature do
  feature 'Input clears errors on blur', :js do
    scenario 'Clear errors on blur' do
      visit('/rails/view_components/rs/input_group/component/standard?error=Test%20error%20message')

      expect(page).to have_field(class: 'ring-error-500')
      expect(page).to have_css(
        'p.text-error-400#error-message',
        text: 'Test error message'
      )

      fill_in 'input_name', with: 'Some text'
      find('input[name="input_name"]').send_keys(:tab)

      expect(page).to have_field(class: 'ring-neutral-300')
      expect(page).to have_no_css(
        'p.text-error-400#error-message',
        text: 'Test error message'
      )
    end
  end
end
