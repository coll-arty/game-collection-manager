module Games
  class OnCollectionItemRemoved
    def call(event)
      collection_item = Games::CollectionItem.find_by(id: event.data[:id])
      collection_item.destroy
    end
  end
end
