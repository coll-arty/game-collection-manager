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

    on GameAdded do |event|
      true
    end
  end
end
