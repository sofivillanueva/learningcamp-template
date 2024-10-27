# frozen_string_literal: true

class AddUserIdToPreferences < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def change
    add_reference :preferences, :user, null: true, index: { algorithm: :concurrently }
  end
end
