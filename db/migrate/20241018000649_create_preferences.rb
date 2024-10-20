class CreatePreferences < ActiveRecord::Migration[7.1]
  def change
    create_table :preferences do |t|
      t.string :name
      t.text :description
      t.boolean :restriction
      t.references :user, foreign_key: true # agrego que la fk de usuario ya que este puede tener muchas preferencias

      t.timestamps
    end
  end
end
