# frozen_string_literal: true

module Collecting
  class CollectionItemLent < Event
    attribute :id, Types::String
    attribute :loanee_name, Types::String
  end
end
