# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :employee_id, null: false
      t.datetime :timestamp, null: false
      t.integer :kind, null: false

      t.timestamps
    end
  end
end
