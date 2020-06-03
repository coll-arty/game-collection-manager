# frozen_string_literal: true

require 'aggregate_root'

module Collecting
  class Collection
    include AggregateRoot

    AlreadyLent = Class.new(StandardError)
    AlreadyReturned = Class.new(StandardError)

    def initialize(id)
      @id = id
      @state = :in_stock
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

    def lend_item(id, loanee_name, loanee_email)
      raise AlreadyLent if @state == :lent

      apply CollectionItemLentV2.new(
        data: {
          id: id,
          loanee_name: loanee_name,
          loanee_email: loanee_email
        }
      )
    end

    def return_item(loan_id)
      raise AlreadyReturned if @state == :in_stock

      apply CollectionItemReturned.new(data: { loan_id: loan_id })
    end

    on CollectionItemAdded do |_event|
      true
    end

    on CollectionItemUpdated do |_event|
      true
    end

    on CollectionItemRemoved do |_event|
      true
    end 

    on CollectionItemLentV2 do |_event|
      @state = :lent
    end

    on CollectionItemReturned do |_event|
      @state = :in_stock
    end
  end
end
