module Consulta
  extend ActiveSupport::Concern
  def consulta(urls, atributo)
      respuesta = []
      urls.each do |url|
          res = HTTParty.get(url, :headers =>{'Content-Type' => 'application/json'} ).body
          char_json = JSON.parse(res)
          tupla = [char_json[atributo], url, get_id(url)]
          respuesta << tupla
      end
      return respuesta
  end

  def consulta_planet(urls, atributo)
          res = HTTParty.get(urls, :headers =>{'Content-Type' => 'application/json'} ).body
          char_json = JSON.parse(res)
          tupla = [char_json[atributo], urls, get_id(urls)]
      return tupla
  end






def get_id(url)
  id = url.split("/")[-1]
  return id
end




end
