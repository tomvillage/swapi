

require 'httparty'
require 'pp'
require 'json'


class StarshipsController < ApplicationController
  include Consulta
  def show
    response = HTTParty.get("https://swapi.co/api/starships/#{params[:id]}", :headers =>{'Content-Type' => 'application/json'} ).body
    @starship = JSON.parse(response)
    @film = consulta(JSON.parse(response)["films"], "title")
    @character = consulta(JSON.parse(response)["pilots"], "name")




  end
  end
