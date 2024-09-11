# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RS::Topbar::Avatar::Component, type: :component do
  subject(:component) { described_class.new(user_id: 1, first_name:, last_name:) }

  let(:first_name) { 'John' }
  let(:last_name) { 'Doe' }

  describe '#avatar_initials' do
    context 'when user has both first and last names' do
      it 'renders the avatar initials correctly' do
        expect(component.avatar_initials).to eq('JD')
      end
    end

    context 'when user has no first name' do
      let(:first_name) { nil }

      it 'renders the avatar initials correctly' do
        expect(component.avatar_initials).to eq('D')
      end
    end

    context 'when user has no last name' do
      let(:last_name) { nil }

      it 'renders the avatar initials correctly' do
        expect(component.avatar_initials).to eq('J')
      end
    end

    context 'when user has no first or last name' do
      let(:first_name) { nil }
      let(:last_name) { nil }

      it 'renders the avatar initials correctly' do
        expect(component.avatar_initials).to be_empty
      end
    end
  end

  describe '#avatar_color' do
    context 'when user has an id' do
      let(:user) { instance_double('User', id: 1) }

      it 'renders the avatar with the correct color' do
        expect(component.avatar_color).to eq(RS::Topbar::Avatar::Component::AVATAR_COLORS[1])
      end
    end
  end
end
