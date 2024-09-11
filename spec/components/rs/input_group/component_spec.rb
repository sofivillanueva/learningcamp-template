# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RS::InputGroup::Component, type: :component do
  subject do
    render_inline(described_class.new(error:)) do |component|
      component.with_label(text: label)
      component.send(:"with_#{type}_field", name: 'test_name')
    end
  end

  let(:args) { { error: } }
  let(:label) { 'Test' }
  let(:type) { %w[text email password].sample }
  let(:error) { nil }

  it 'renders component' do
    subject
    expect(page).to have_field(
      label, type:, name: 'test_name'
    )
  end

  context 'with error message' do
    let(:label) { 'Email' }
    let(:attribute) { 'email' }
    let(:error) { 'Test erorr message' }

    it 'renders the error message' do
      subject
      expect(page).to have_css(
        'p.text-error-400#error-message',
        text: 'Test erorr message'
      )
    end
  end
end
