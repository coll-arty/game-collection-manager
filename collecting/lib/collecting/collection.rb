require 'aggregate_root'

module Collecting
  class Collection
    include AggregateRoot

    def initialize(id)
      @id = id
    end

    def add(id, name)
      apply CollectionItemAdded.new(data: { id: id, name: name })
    end

    def update_item(id, name)
      apply CollectionItemUpdated.new(data: { id: id, name: name })
    end

    def remove_item(id)
      apply CollectionItemRemoved.new(data: { id: id })
    end

    def lend_item(id, loanee_name)
      apply CollectionItemLent.new(data: { id: id, loanee_name: loanee_name })
    end

    on CollectionItemAdded do |event|
      true
    end

    on CollectionItemUpdated do |event|
      true
    end

    on CollectionItemRemoved do |event|
      true
    end

    on CollectionItemLent do |event|
      true
    end
  end
end
