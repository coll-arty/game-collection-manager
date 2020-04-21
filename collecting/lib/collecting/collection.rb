require 'aggregate_root'

module Collecting
  class Collection
    include AggregateRoot

    def initialize(id)
      @id = id
    end

    def add(id, name)
      apply GameAdded.new(data: { id: id, name: name })
    end

    def update_item(id, name)
      apply ItemUpdated.new(data: { id: id, name: name })
    end

    def remove_item(id)
      apply ItemRemoved.new(data: { id: id })
    end

    on GameAdded do |event|
      true
    end

    on ItemUpdated do |event|
      true
    end

    on ItemRemoved do |event|
      true
    end
  end
end
