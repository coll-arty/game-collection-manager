module Collecting
  class CollectionItemRemoved < Event
    attribute :id, Types::String
  end
end
