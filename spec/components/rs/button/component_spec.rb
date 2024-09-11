# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RS::Button::Component, type: :component do
  it 'renders with default parameters' do
    rendered = render_inline(described_class.new(text: 'Button text'))
    expect(rendered.to_html).to include('Button text')
    expect(rendered.css('button').attr('type').value).to eq('button')
    expect(rendered.css('button').attr('disabled')).to be_nil
  end

  it 'renders correctly with custom parameters' do
    rendered = render_inline(described_class.new(text: 'Submit', type: 'submit'))
    expect(rendered.to_html).to include('Submit')
    expect(rendered.css('button').attr('type').value).to eq('submit')
  end

  %w[button submit reset].each do |type|
    it "renders the correct button type for #{type}" do
      rendered = render_inline(described_class.new(text: 'Test', type:))
      expect(rendered.css('button').attr('type').value).to eq(type)
    end
  end

  it 'renders as disabled when disabled is true' do
    rendered = render_inline(described_class.new(text: 'Disabled', disabled: true))
    expect(rendered.css('button').attr('disabled')).to be_present
  end

  it 'does not render as disabled when disabled is false' do
    rendered = render_inline(described_class.new(text: 'Enabled', disabled: false))
    expect(rendered.css('button').attr('disabled')).to be_nil
  end
end
