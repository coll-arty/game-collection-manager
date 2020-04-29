module Games
  class OnCollectionItemReturned
    def call(event)
      loan_id = event.data[:loan_id]
      Games::Loan.find(loan_id).destroy
    end
  end
end
