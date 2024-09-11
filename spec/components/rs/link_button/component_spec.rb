# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RS::LinkButton::Component, type: :component do
  subject { render_inline(described_class.new(text:, url:, color:)) }

  let(:text) { 'Click Me' }
  let(:url) { '#' }
  let(:color) { :primary }

  describe 'renders correctly' do
    it 'has the provided text' do
      expect(subject).to have_text text
    end

    it 'links to the provided URL' do
      expect(subject).to have_link(text, href: url)
    end

    it 'applies the correct style class based on color' do
      expect(subject).to have_css("a[class~='#{Regexp.escape(RS::LinkButton::Component::STYLES[color])}']")
    end
  end
end
