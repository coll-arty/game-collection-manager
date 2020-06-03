# frozen_string_literal: true

module Games
  class ReturnRemindersController < ApplicationController
    def create
      with_aggregate(Collecting::Collection, SecureRandom.uuid) do |collection|
        collection.send_return_reminders
      end
      borrowers = Games::Loan

      redirect_to collection_items_path, notice: "Return reminders sent to #{borrowers.count} borrowers."
    end
  end
end
