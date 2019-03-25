class SearchesController < ApplicationController

  include Consulta



  def index
    response1 = HTTParty.get("https://swapi.co/api/people/?search=#{params[:q]}", :headers =>{'Content-Type' => 'application/json'} ).body
    @character = consulta_search(JSON.parse(response1)["results"], "name")
    response2 = HTTParty.get("https://swapi.co/api/films/?search=#{params[:q]}", :headers =>{'Content-Type' => 'application/json'} ).body
    @film = consulta_search(JSON.parse(response2)["results"], "title")
    response3 = HTTParty.get("https://swapi.co/api/planets/?search=#{params[:q]}", :headers =>{'Content-Type' => 'application/json'} ).body
    @planet = consulta_search(JSON.parse(response3)["results"], "name")
    response4 = HTTParty.get("https://swapi.co/api/starships/?search=#{params[:q]}", :headers =>{'Content-Type' => 'application/json'} ).body
    @starship = consulta_search(JSON.parse(response4)["results"], "name")



  end

  def show
    puts "sapo ql"
    puts params[:q]
  end
end
