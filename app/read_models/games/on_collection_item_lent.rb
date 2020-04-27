module Games
  class OnCollectionItemLent
    def call(event)
      collection_item_id = event.data[:id]
      loanee = event.data[:loanee_name]
      Games::Loan.create(games_collection_item_id: collection_item_id, loanee: loanee)
    end
  end
end
