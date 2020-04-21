module Games
  class OnItemRemoved
    def call(event)
      game = Game.find_by(id: event.data[:id])
      game.destroy
    end
  end
end
