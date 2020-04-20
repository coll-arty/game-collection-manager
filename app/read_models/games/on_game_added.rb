module Games
  class OnGameAdded
    def call(event)
      Game.create!(uuid: event.data[:id], name: event.data[:name])
    end
  end
end
