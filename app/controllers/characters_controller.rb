require 'httparty'
require 'pp'
require 'json'


class CharactersController < ApplicationController
  include Consulta

  def show
    response = HTTParty.get("https://swapi.co/api/people/#{params[:id]}", :headers =>{'Content-Type' => 'application/json'} ).body
    @character = JSON.parse(response)
    @film = consulta(JSON.parse(response)["films"], "title")
    @starship = consulta(JSON.parse(response)["starships"], "name")
    @planet = consulta_planet(JSON.parse(response)["homeworld"], "name")

  end
  end
