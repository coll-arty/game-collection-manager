module Collecting
  class CollectionItemLentV2 < Event
    attribute :id, Types::String
    attribute :loanee_name, Types::String
    attribute :loanee_email, Types::String
  end
end
