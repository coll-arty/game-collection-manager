require 'aggregate_root'

module Collecting
  class Collection
    include AggregateRoot

    def initialize(id)
      @id = id
    end

    def add(name)
      apply GameAdded.new(data: { name: name })
    end

    on GameAdded do |event|
      true
    end
  end
end
