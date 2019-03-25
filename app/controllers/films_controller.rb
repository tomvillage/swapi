require 'httparty'
require 'pp'
require 'json'

class FilmsController < ApplicationController
  include Consulta
  def show
    response = HTTParty.get("https://swapi.co/api/films/#{params[:id]}", :headers =>{'Content-Type' => 'application/json'} ).body
    @film = JSON.parse(response)
    @character = consulta(JSON.parse(response)["characters"], "name")
    @starship = consulta(JSON.parse(response)["starships"], "name")
    @planet = consulta(JSON.parse(response)["planets"], "name")
    puts @character

  end
end
