module Games
  class OnGameAdded
    def call(event)
      Game.create!(name: event.data[:name])
    end
  end
end
