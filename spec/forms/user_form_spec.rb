# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserForm do
  subject { described_class.new(args:).save }

  let(:args) do
    { first_name:, last_name:, email: }
  end
  let(:email) { 'juanlopez@example.com' }
  let(:first_name) { 'juan' }
  let(:last_name) { 'lopez' }

  context 'with valid arguments' do
    it 'creates a new user' do
      expect { subject }.to change(User, :count).by 1
    end
  end

  context 'with missing email' do
    let(:email) { '' }

    it { is_expected.to be false }

    it 'doesn\'t create a new user' do
      expect { subject }.not_to change(User, :count)
    end
  end
end
