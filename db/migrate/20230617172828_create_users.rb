# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :refresh
      t.boolean :guest, default: false
      t.integer: wins, default: 0
      t.integer: loses, default: 0

      t.timestamps
    end
  end
end
