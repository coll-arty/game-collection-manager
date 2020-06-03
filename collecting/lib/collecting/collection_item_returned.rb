# frozen_string_literal: true

module Collecting
  class CollectionItemReturned < Event
    attribute :loan_id, Types::String
  end
end
