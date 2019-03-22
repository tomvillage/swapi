require 'httparty'
require 'pp'
require 'json'


class CharactersController < ApplicationController

  def index

    response = HTTParty.get('https://swapi.co/api/films', :headers =>{'Content-Type' => 'application/json'} ).body
    response_json = JSON.parse(response)
    puts response["results"]
    puts "__________________________"
    puts response["results"]


  end

  end
