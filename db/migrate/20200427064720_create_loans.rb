# frozen_string_literal: true

class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :games_loans do |t|
      t.references :games_collection_item, null: false, foreign_key: true
      t.text :loanee, null: false

      t.timestamps
    end
  end
end
