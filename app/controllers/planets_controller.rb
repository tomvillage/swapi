require 'httparty'
require 'pp'
require 'json'


class PlanetsController < ApplicationController
  include Consulta

  def show
    response = HTTParty.get("https://swapi.co/api/planets/#{params[:id]}", :headers =>{'Content-Type' => 'application/json'} ).body
    @planet = JSON.parse(response)
    @film = consulta(JSON.parse(response)["films"], "title")
    @character = consulta(JSON.parse(response)["residents"], "name")
  end


  end
