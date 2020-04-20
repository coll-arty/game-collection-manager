module Collecting
  class GameAdded < Event
    attribute :id, Types::String
    attribute :name, Types::String
  end
end
