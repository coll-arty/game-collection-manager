module Collecting
  class ItemUpdated < Event
    attribute :id, Types::String
    attribute :name, Types::String
  end
end
