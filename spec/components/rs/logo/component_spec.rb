# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RS::Logo::Component, type: :component do
  let(:alt) { 'My company' }
  let(:src) { instance_double('mark', content_type: 'svg', original_filename: 'mark') }
  let(:component) { described_class.new(src:, alt:) }
  let(:rendered_component) { render_inline(component) }

  it 'renders the company name as alt text' do
    alt_text = rendered_component.at_css('img')['alt']
    expect(alt_text).to eq alt
  end
end
