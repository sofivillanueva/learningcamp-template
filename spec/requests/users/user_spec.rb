# frozen_string_literal: true

require 'rails_helper'

describe 'Users' do
  describe 'GET index' do
    subject { get users_path }

    context 'when logged in' do
      let!(:user) { create(:user) }

      before { sign_in user }

      it 'have http status 200' do
        expect(subject).to eq(200)
      end
    end
  end

  describe 'GET new' do
    subject { get new_user_path }

    context 'when logged in' do
      let!(:user) { create(:user) }

      before { sign_in user }

      it 'have http status 200' do
        expect(subject).to eq(200)
      end
    end
  end

  describe 'POST create' do
    subject { post users_path, params: }

    let(:params) { {} }

    context 'when logged in' do
      let!(:user) { create(:user) }

      before { sign_in user }

      context 'when success' do
        let(:params) do
          {
            user: {
              first_name: 'FirstName',
              last_name: 'LastName',
              email: 'test@example.com',
              password: 'password',
              password_confirmation: 'password'
            }
          }
        end

        it 'creates the user' do
          expect { subject }.to change(User, :count).by(1)
        end

        it 'redirect to index' do
          expect(subject).to redirect_to(users_path)
        end

        it 'have http status 302' do
          expect(subject).to eq(302)
        end
      end

      context 'when fails' do
        let(:params) do
          {
            user: {
              first_name: 'FirstName',
              last_name: 'LastName',
              email: user.email,
              password: 'password',
              password_confirmation: 'password'
            }
          }
        end

        it 'have http status 422' do
          expect(subject).to eq(422)
        end
      end
    end
  end

  describe 'DELETE destroy' do
    subject { delete user_path(user) }

    context 'when logged in' do
      let!(:user) { create(:user) }
      let!(:logged_user) { create(:user) }

      before do
        sign_in logged_user
      end

      it 'destroys the user and associated memberships' do
        expect {
          delete user_path(user)
        }.to change(User, :count).by(-1)
      end

      it 'redirects to the users path with a success notice' do
        delete user_path(user)
        expect(response).to redirect_to(users_path)
        expect(flash[:notice]).to eq(I18n.t('views.users.destroy_success'))
      end
    end
  end
end
