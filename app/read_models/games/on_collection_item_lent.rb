# frozen_string_literal: true

module Games
  class OnCollectionItemLent
    def call(event)
      collection_item_id = event.data[:id]
      loanee_name = event.data[:loanee_name]
      loanee_email = event.data[:loanee_email]
      Games::Loan.create(games_collection_item_id: collection_item_id, loanee: loanee_name, loanee_email: loanee_email)
    end
  end
end
