# frozen_string_literal: true

# == Schema Information
#
# Table name: preferences
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  restriction :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_preferences_on_user_id  (user_id)
#

# 1. generar migracion(create_preferences) y modelo(PreferencesController):
# rails generate model Preference name:string description:text restriction:boolean

# 2. rails db:migrate: genera la tabla preferences

# 3. agregamos en el modelo las restricciones (nombre obligatorio, valores nulos)
# y las relaciones en caso de que las haya.

# Active Record - Conceptos Básicos:
# Es el ORM (Object-Relational Mapping) de Rails
# Convierte tablas en clases, filas en objetos y columnas en atributos
# Sigue el patrón de diseño Active Record donde:

# Los objetos llevan datos y comportamiento
# La persistencia está manejada por la clase
# Los nombres siguen convenciones (ej: clase Preference → tabla preferences)

# TASK: Ensure that the name, description, and restriction attributes are correctly handled in the preferences table.
class Preference < ApplicationRecord
  MAX_PREFERENCES = 5 # VER
  # validaciones
  validates :name, presence: true # no puede ser nulo
  validates :description, presence: true # no puede ser nulo
  validates :restriction, inclusion: [true, false] # la restriccion toma valores de true o false

  before_validation :set_default_restriction # antes de la validacion va al metodo set_default_restriction

  private

  # si el parametro restriction llega nil(null) lo setea a false, ya que esto significa que el usuario no lo seleccionó
  def set_default_restriction
    self.restriction = false if restriction.nil?
  end
  # relaciones
  belongs_to :user # 1 preferencia pertenece a 1 usuario
end
