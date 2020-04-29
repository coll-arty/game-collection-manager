module Games
  class LoansController < ApplicationController
    def new
      @collection_item_id = params['collection_item_id']
    end

    def create
      loanee_name = params[:loanee_name]
      collection_item_id = params[:collection_item_id]
      with_aggregate(Collecting::Collection, collection_item_id) do |collection|
        collection.lend_item(collection_item_id, loanee_name)
      end
  
      redirect_to collection_items_path, notice: "Game was successfully lent to #{loanee_name}."
    end

    def destroy
      loan_id = params[:id]

      with_aggregate(Collecting::Collection, loan_id) do |collection|
        collection.return_item(loan_id)
      end

      redirect_to collection_items_path, notice: "Game was successfully returned."
    end
  end  
end
