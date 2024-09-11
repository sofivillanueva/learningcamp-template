# frozen_string_literal: true

RSpec.describe RS::Link::Component, type: :component do
  subject do
    render_inline(described_class.new(text:, url:, color:))
  end

  let(:text) { 'Forgot password?' }
  let(:url) { '#' }
  let(:color) { 'primary' }

  describe 'rendering' do
    it 'renders a link with the provided text' do
      expect(subject).to have_link(text)
    end

    it 'renders a link with the provided URL' do
      expect(subject).to have_link(text, href: url)
    end
  end
end
