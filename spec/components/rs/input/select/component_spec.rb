# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RS::Input::Select::Component, type: :component do
  subject do
    render_inline(described_class.new(**args))
  end

  let(:type) { 'select' }
  let(:name) { 'input_name' }
  let(:placeholder) { 'placeholder_text' }
  let(:items) do
    [
      { value: '1', description: 'First option' },
      { value: '2', description: 'Second option' }
    ]
  end
  let(:args) do
    { name: 'input_name', type:, placeholder:, items: }
  end

  it 'renders component' do
    subject

    expect(page).to have_select(
      name,
      with_options: [placeholder, 'First option', 'Second option']
    )
  end
end
