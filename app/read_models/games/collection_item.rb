module Games
  class CollectionItem < ApplicationRecord
    self.table_name = "games_collection_items"

    has_one :loan,
            class_name: 'Games::Loan',
            foreign_key: 'games_collection_item_id'
  end
end
