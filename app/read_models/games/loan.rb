# frozen_string_literal: true

module Games
  class Loan < ApplicationRecord
    self.table_name = 'games_loans'

    belongs_to :collection_item,
               class_name: 'Games::CollectionItem',
               foreign_key: 'games_collection_item_id'
  end
end
