# frozen_string_literal: true

class CreatePortfolios < ActiveRecord::Migration[7.0]
  reversible do |dir|
    dir.up do
      create_table :portfolios do |t|
        t.string :investor_name

        t.timestamps
      end
    end
    dir.down do
      drop_table :portfolios
    end
  end
end
