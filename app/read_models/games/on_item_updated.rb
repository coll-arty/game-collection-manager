module Games
  class OnItemUpdated
    def call(event)
      game = Game.find_by(id: event.data[:id])
      game.update(name: event.data[:name])
    end
  end
end
