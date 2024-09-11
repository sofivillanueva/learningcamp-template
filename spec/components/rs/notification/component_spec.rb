# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RS::Notification::Component, type: :component do
  subject { render_inline(described_class.new(key:, message:)) }

  let(:key) { 'notice' }
  let(:message) { 'This is a notification message.' }

  it 'renders the correct controller class' do
    expect(subject).to have_css("[data-controller='rs--notification--component']")
  end

  it 'renders the message content' do
    expect(subject).to have_text(message)
  end

  it 'styles the component based on notice' do
    svg_class = subject.at_css('svg').attribute('class')
    expect(svg_class.value.include?('success')).to be(true)
  end

  context 'with an unknown key' do
    let(:key) { 'unknown' }

    it 'renders without a specific color class' do
      svg_class = subject.at_css('svg').attribute('class')
      expect(svg_class).to be_nil
    end
  end
end
