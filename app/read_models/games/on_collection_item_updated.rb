module Games
  class OnCollectionItemUpdated
    def call(event)
      collection_item = Games::CollectionItem.find_by(id: event.data[:id])
      collection_item.update(name: event.data[:name])
    end
  end
end
