# frozen_string_literal: true



class PreferencesController < ApplicationController

    def index
        @preferences = current_user.preferences # trae todas las pref de la base de datos, current_user.preferences
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
            #render :new, alert: 'La preferencia no pudo ser agregada, verifique los campos e intente nuevamente.' # se utiliza  para mostrar la vista actual
            redirect_to new, alert: 'La preferencia no pudo ser agregada, verifique los campos e intente nuevamente.'
             
        end

    end

    def show
        @preference = Preference.find(params[:id])
    end

    private
     # manejo de parámetros - método privado para filtrar parámetros permitidos (por seguridad)
    def preference_params # esta es la forma de poder acceder a los parametros de un form
        params.require(:preference).permit(:name, :description, :restriction) # como obtiene los valores del formulario?
    end

end
