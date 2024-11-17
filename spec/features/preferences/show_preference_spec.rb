# frozen_string_literal: true

require 'rails_helper'

# aca voy a describir el resultado correcto de ir al listado de preferencias,
# seleccionar la primera y cliquear en el boton show

# 1. debo estar logueada con un usuario
# 2. ese usuario debe estar creado
# 3. tiene que tener una preferencia

RSpec.describe 'Show preference', :js do
  let(:admin_user) { create(:user, email: 'admin@test.com', password: '123123123') }
  let!(:preference) do
    create(:preference, name: 'Dieta', description: 'Dieta vegetariana', restriction: true, user: admin_user)
  end

  before do
    sign_in admin_user
    preference # Crea la preferencia
    visit preferences_path
    show_first_preference
  end

  describe '#show' do
    context 'when clicking on some preference' do
      it 'show the data the requested preference' do
        within '#panel' do
          expect(page).to have_content('Name')
          expect(page).to have_content('Description')
          expect(page).to have_content('Restriction')
        end
      end

      it 'the data it\'s not editable' do
        expect(page).to have_field('preference[name]', disabled: true)
        expect(page).to have_field('preference[description]', disabled: true)
        expect(page).to have_field('preference[restriction]', disabled: true)
      end
    end
  end

  def show_first_preference
    within all('tbody tr').first do # busco la primera preferencia de la tabla
      click_on 'Show' # clickeo en el boton show
    end
  end
end
