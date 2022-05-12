# frozen_string_literal: true

class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        create_table :stocks do |t|
          t.integer :price
          t.integer :investment
          t.integer :profit
          t.references :portfolio, foreign_key: true

          t.timestamps
        end
      end
      dir.down do
        drop_table :stocks
      end
    end
  end
end
