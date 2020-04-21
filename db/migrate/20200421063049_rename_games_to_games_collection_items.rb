class RenameGamesToGamesCollectionItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :games, :games_collection_items
  end
end
