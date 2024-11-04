# frozen_string_literal: true

class ValidateAddForeignKeyToPreferences < ActiveRecord::Migration[7.1]
  def change
    validate_foreign_key :preferences, :users
  end
end
