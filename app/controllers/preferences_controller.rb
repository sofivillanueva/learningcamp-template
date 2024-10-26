# frozen_string_literal: true

# convencion RESTful
# GET para index y show
# POST para create
# PATCH/PUT para update
# DELETE para destroy

class PreferencesController < ApplicationController

    def index
        @preferences = current_user.preferences # Preferences.all trae todas las pref de la base de datos, current_user.preferences trae solo las del usuario logueado
        @pagy, @records = pagy(@preferences) # Inicializa @records con las preferencias, esto asume que @preferences tiene registros disponibles.
    end

    #get
    def new # el new siempre muestra el formulario, (para crear una nueva preferencia)
        @preference = Preference.new  # crea una instancia vacía para el formulario

    end
    #post
    def create # recibe los datos del form
        @preference = current_user.preferences.new(preference_params) # creamos una nueva preferencia asociada al usuario actual

        if @preference.save  # intenta guardar la preferencia
            redirect_to preference_path(@preference), notice: 'Preferencia creada con éxito' # se utiliza el redirect_to para cambiar de vista
        else
            # renderiza el formulario de creación nuevamente
            #  mantiene los datos ingresados y muestra los errores
            render :new, status: :unprocessable_entity
            
        end

    end

    def show
        @preference = Preference.find(params[:id]) # podria utilizar un callback
    end

    def edit
        @preference = Preference.find(params[:id]) # podria utilizar un callback
    end

    def update
        @oldPreference = Preference.find(params[:id]) # busco la preferencia por su id, podria utilizar un callback
        if @oldPreference.update!(preference_params) # si logro editarla, (el ! para no crear una nueva, si no modificar la existente), con los parametros que recibo del form
            redirect_to preference_path, notice: "La preferencia ha sido editada exitosamente."
        else
            render :edit, status: :unprocessable_entity
        end
    end

# En Ruby on Rails, la convención method: :delete en el enlace especifica que la solicitud HTTP será de tipo DELETE, 
#y Rails automáticamente mapea este tipo de solicitud al método destroy

    def destroy
        @oldPreference = Preference.find(params[:id]) # busco la preferencia por su id, podria utilizar un callback
        if @oldPreference.destroy!
            redirect_to preference_path, notice: "La preferencia ha sido eliminada exitosamente."
        else
            redirect_to preference_path, alert: "La preferencia no pudo ser eliminada."
        end
    end 
    # private # 

    private
    # manejo de parámetros - método privado para filtrar parámetros permitidos (por seguridad)
    def preference_params # esta es la forma de poder acceder a los parametros de un form en Ruby
        params.require(:preference).permit(:name, :description, :restriction) 
    end

end
