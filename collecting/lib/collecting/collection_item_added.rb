module Collecting
  class CollectionItemAdded < Event
    attribute :id, Types::String
    attribute :name, Types::String
  end
end
