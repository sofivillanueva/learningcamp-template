# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RS::Panel::Component, type: :component do
  it 'renders content within slots' do
    subject = render_inline(described_class.new) { |component| component.with_body { 'Hello' } }
    expect(subject).to have_text('Hello')
  end
end
