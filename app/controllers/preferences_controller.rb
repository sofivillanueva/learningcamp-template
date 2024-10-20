# frozen_string_literal: true



class PreferencesController < ApplicationController

    def index
        @preferences = Preference.all
        @pagy, @records = pagy(@preferences) # Inicializa @records con las preferencias, esto asume que @preferences tiene registros disponibles.
    end

    def new # el new siempre muestra el formulario, (para crear una nueva preferencia)
        @preference = Preference.new  # crea una instancia vacía para el formulario

    end

    def create # recibe los datos del form
        @preference = current_user.preferences.build(preference_params) # creamos una nueva preferencia asociada al usuario actual, ver como sabe que tiene que usar la variable current_user y que hace el build? de que es ese metodo?
        
        if @preference.save  # intenta guardar la preferencia
            redirect_to preference_path(@preference), notice: 'Preferencia creada con éxito' # se utiliza el redirect_to para cambiar de vista
          else
            # renderiza el formulario de creación nuevamente
            #  mantiene los datos ingresados y muestra los errores
            puts @preference.errors.full_messages  # para imprimir los errores en la consola del servidor
            render :new, alert: 'La preferencia no pudo ser agregada, verifique los campos e intente nuevamente.' # se utiliza  para mostrar la vista actual
          end

    end

    def show
        @preference = Preference.find(params[:id])
    end

  
#    def create # recibe los datos del form
 #       @preference = current_user.preferences.build(preference_params) # creamos una nueva preferencia asociada al usuario actual, ver como sabe que tiene que usar la variable current_user y que hace el build? de que es ese metodo?
  #      
  #      if @preference.save  
  #          # lo retorna a una view con todas las preferencias
  #          redirect_to preferences_path, notice: 'Preferencia creada con éxito' # averiguar que seria el preferences_path
  #          # envia un cartel de exito
  #        else
  #          # lo retorna al formulario
  #          # envia un cartel de error
  #        end
  #  end

    private
     # manejo de parámetros - método privado para filtrar parámetros permitidos (por seguridad)
    def preference_params
        params.require(:preference).permit(:name, :description, :restriction) # como obtiene los valores del formulario?
    end

end
