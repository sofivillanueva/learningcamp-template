# frozen_string_literal: true

# convencion RESTful
# GET para index y show
# POST para create
# PATCH/PUT para update
# DELETE para destroy

class PreferencesController < ApplicationController
  def index
    @preferences = current_user.preferences # Preferences.all trae todas las pref de la base de datos,
    # current_user.preferences trae solo las del usuario logueado
    @pagy, @records = pagy(@preferences) # Inicializa @records con las preferencias,
    # esto asume que @preferences tiene registros disponibles.
  end

  def show
    @preference = Preference.find(params[:id]) # podria utilizar un callback
  end

  # get
  # el new siempre muestra el formulario, (para crear una nueva preferencia)
  def new
    @preference = Preference.new # crea una instancia vacía para el formulario
  end

  def edit
    @preference = Preference.find(params[:id]) # podria utilizar un callback
  end

  # post
  # recibe los datos del form
  def create
    is_valid = ValidatePreferencesPerUser.new(current_user.id).call # si da true, crea la pref
    if  is_valid == true
      @preference = current_user.preferences.new(preference_params)
      # creamos una nueva preferencia asociada al usuario actual

      if @preference.save # intenta guardar la preferencia
        redirect_to preference_path(@preference), notice: t('.success')
        # se utiliza el redirect_to para cambiar de vista
      else
        # renderiza el formulario de creación nuevamente
        #  mantiene los datos ingresados y muestra los errores
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to preferences_path, alert: t('.errorPref')
    end
  end

  def update
    @old_preference = Preference.find(params[:id]) # busco la preferencia por su id,
    # podria utilizar un callback
    if @old_preference.update!(preference_params) # si logro editarla,
      # (el ! para no crear una nueva, si no modificar la existente), con los parametros que recibo del form
      redirect_to preference_path, notice: t('.success')
      # los mnsjs de texto estan en archivos de localizacion (config/locales/en.yml)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # En Ruby on Rails, la convención method: :delete en el enlace especifica que la solicitud HTTP será de tipo DELETE,
  # y Rails automáticamente mapea este tipo de solicitud al método destroy

  def destroy
    @old_preference = Preference.find(params[:id]) # busco la preferencia por su id, podria utilizar un callback
    if @old_preference.destroy!
      redirect_to preference_path, notice: t('.success')
    else
      redirect_to preference_path, alert: t('.error')
    end
  end

  private

  # manejo de parámetros - método privado para filtrar parámetros permitidos (por seguridad)
  # esta es la forma de poder acceder a los parametros de un form en Ruby
  def preference_params
    params.require(:preference).permit(:name, :description, :restriction)
  end
end
