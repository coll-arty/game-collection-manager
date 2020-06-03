# frozen_string_literal: true

module Collecting
  class CollectionItemUpdated < Event
    attribute :id, Types::String
    attribute :name, Types::String
  end
end
