# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :passHash, null: false
      t.string :refresh
      t.boolean :guest, default: false, null: false

      t.timestamps
    end
  end
end
