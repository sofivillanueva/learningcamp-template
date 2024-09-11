# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RS::Input::Attachment::Component, type: :component do
  subject do
    render_inline(described_class.new(name:))
  end

  let(:name) { 'name' }

  it 'renders component' do
    subject
    expect(page).to have_field(name: 'name')
  end
end
