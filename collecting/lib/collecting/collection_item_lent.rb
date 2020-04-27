module Collecting
  class CollectionItemLent < Event
    attribute :id, Types::String
    attribute :loanee_name, Types::String
  end
end
