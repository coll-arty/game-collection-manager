# frozen_string_literal: true

module Games
  class OnCollectionItemAdded
    def call(event)
      Games::CollectionItem.create!(uuid: event.data[:id], name: event.data[:name])
    end
  end
end
