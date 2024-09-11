# frozen_string_literal: true

RSpec.shared_examples 'input component' do |type|
  subject do
    render_inline(described_class.new(**args))
  end

  let(:args) do
    { name: 'input_name', placeholder: 'placeholder_text' }
  end

  it 'renders component' do
    subject
    expect(page).to have_field(
      type:,
      name: 'input_name',
      placeholder: 'placeholder_text'
    )
  end

  context 'with required field' do
    let(:args) { { name: 'input_name', required: true } }

    it 'renders input as required' do
      subject
      expect(page).to have_css('input[name="input_name"][required]')
    end
  end
end
