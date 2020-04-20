class GamesController < ApplicationController
  def index
    @games = Games::Game.all
  end

  def show
    @game = Games::Game.find(params[:id])
  end

  def new
    @game = Games::Game.new
  end

  def edit
    @game = Games::Game.find(params[:id])
  end

  def create
    game_id = SecureRandom.uuid
    game_name = params[:games_game][:name]
    with_aggregate(Collecting::Collection, game_id) do |collection|
      collection.add(game_id, game_name)
    end

    redirect_to games_path, notice: 'Game was successfully added to your collection.'
  end

  def update
    @game = Games::Game.find(params[:id])
    game_name = params[:games_game][:name]

    with_aggregate(Collecting::Collection, @game.uuid) do |collection|
      collection.update_item(@game.id, game_name)
    end

    redirect_to game_path(@game), notice: 'Collection item was successfully updated.'
  end

  def destroy
    @game = Games::Game.find(params[:id])
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
