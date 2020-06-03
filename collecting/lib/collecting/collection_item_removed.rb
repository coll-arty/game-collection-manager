# frozen_string_literal: true

module Collecting
  class CollectionItemRemoved < Event
    attribute :id, Types::String
  end
end
