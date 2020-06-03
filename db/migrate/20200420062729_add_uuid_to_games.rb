# frozen_string_literal: true

class AddUuidToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :uuid, :string
  end
end
