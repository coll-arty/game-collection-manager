module Collecting
  class ItemRemoved < Event
    attribute :id, Types::String
  end
end
