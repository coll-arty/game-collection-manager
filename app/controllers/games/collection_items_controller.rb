# frozen_string_literal: true

module Games
  class CollectionItemsController < ApplicationController
    def index
      @collection_items = Games::CollectionItem.all.includes(:loan)
    end

    def show
      @collection_item = Games::CollectionItem.find(params[:id])
    end

    def new
      @collection_item = Games::CollectionItem.new
    end

    def edit
      @collection_item = Games::CollectionItem.find(params[:id])
    end

    def create
      collection_item_id = SecureRandom.uuid
      collection_item_name = params[:games_collection_item][:name]
      with_aggregate(Collecting::Collection, collection_item_id) do |collection|
        collection.add(collection_item_id, collection_item_name)
      end

      redirect_to collection_items_path, notice: 'Game was successfully added to your collection.'
    end

    def update
      @collection_item = Games::CollectionItem.find(params[:id])
      collection_item_name = params[:games_collection_item][:name]

      with_aggregate(Collecting::Collection, @collection_item.uuid) do |collection|
        collection.update_item(@collection_item.id, collection_item_name)
      end

      redirect_to collection_item_path(@collection_item), notice: 'Collection item was successfully updated.'
    end

    def destroy
      @collection_item = Games::CollectionItem.find(params[:id])
      with_aggregate(Collecting::Collection, @collection_item.uuid) do |collection|
        collection.remove_item(@collection_item.id)
      end

      redirect_to collection_items_url, notice: 'Item was successfully removed.'
    end

    private

    def collection_item_params
      params.require(:collection_item).permit(:name)
    end
  end
end
