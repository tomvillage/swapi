
require 'httparty'
require 'pp'
require 'json'

class WelcomeController < ApplicationController

  def index
    response = HTTParty.get('https://swapi.co/api/films', :headers =>{'Content-Type' => 'application/json'} ).body
    @films = JSON.parse(response)["results"]


    end


  end
