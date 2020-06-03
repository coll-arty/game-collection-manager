# frozen_string_literal: true

module Collecting
  class ReturnRemindersSent < Event
    attribute :date, Types::DateTime
  end
end
