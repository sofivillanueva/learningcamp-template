# frozen_string_literal: true

RSpec.describe RS::Checkbox::Component, type: :component do
  subject do
    render_inline(described_class.new(id:, name:, label:, checked:))
  end

  let(:id) { 'id_checkbox' }
  let(:name) { 'name' }
  let(:label) { 'Remember me' }
  let(:checked) { false }

  describe 'renders the checkbox component' do
    it 'has the correct id' do
      expect(subject.css("input[id='#{id}']")).to be_present
    end

    it 'has the correct name attribute' do
      expect(subject.css("input[name='#{name}']")).to be_present
    end

    it 'has the correct label text' do
      expect(subject.text).to include(label)
    end

    context 'when checked is true' do
      let(:checked) { true }

      it 'renders a checked checkbox' do
        expect(subject.css('input[checked]')).to be_present
      end
    end

    context 'when checked is false (default)' do
      it 'renders an unchecked checkbox' do
        expect(subject.css('input[checked]')).not_to be_present
      end
    end
  end
end
