# frozen_string_literal: true

require 'rails_event_store'
require 'aggregate_root'
require 'arkency/command_bus'

Rails.configuration.to_prepare do
  Rails.configuration.event_store = RailsEventStore::Client.new
  Rails.configuration.command_bus = Arkency::CommandBus.new

  AggregateRoot.configure do |config|
    config.default_event_store = Rails.configuration.event_store
  end

  Rails.configuration.event_store.tap do |store|
    store.subscribe(Games::OnCollectionItemAdded, to: [Collecting::CollectionItemAdded])
    store.subscribe(Games::OnCollectionItemUpdated, to: [Collecting::CollectionItemUpdated])
    store.subscribe(Games::OnCollectionItemRemoved, to: [Collecting::CollectionItemRemoved])
    store.subscribe(Games::OnCollectionItemLent, to: [Collecting::CollectionItemLentV2])
    store.subscribe(Games::OnCollectionItemReturned, to: [Collecting::CollectionItemReturned])
    store.subscribe(Games::OnReturnRemindersSent, to: [Collecting::ReturnRemindersSent])
  end
end
