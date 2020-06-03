# frozen_string_literal: true

class AddEmailToGamesLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :games_loans, :loanee_email, :text
  end
end
