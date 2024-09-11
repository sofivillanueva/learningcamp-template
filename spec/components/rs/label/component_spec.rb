# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RS::Label::Component, type: :component do
  subject do
    render_inline(described_class.new(text:, html_for:))
  end

  let(:text) { 'Test' }
  let(:html_for) { 'binded_target' }

  it 'renders component' do
    subject
    expect(page).to have_css('label', text:)
    expect(page).to have_css("label[for=#{html_for}]")
  end
end
