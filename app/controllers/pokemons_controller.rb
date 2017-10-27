class PokemonsController < ApplicationController
  def capture
    pm = Pokemon.find(params[:id])
    pm.trainer_id = current_trainer.id
    pm.save
    redirect_to root_path
  end

  def damage
    pm = Pokemon.find(params[:id])
    pm.health -= 10
    if pm.health != 0
      pm.save
    else
      pm.destroy
    end
    redirect_to trainer_path(current_trainer)
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(name: params[:pokemon][:name])
    @pokemon.level = 1
    @pokemon.health = 100
    @pokemon.trainer = current_trainer
    @pokemon.save
    redirect_to trainer_path(current_trainer)
  end

  def show
    @pokemons = Pokemon.all
    @pokemon = Pokemon.find(params[:id])
  end
end
