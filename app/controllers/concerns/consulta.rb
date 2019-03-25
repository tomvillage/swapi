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

  def consulta_search(json, atributo)
    listas_url = []
      while json["next"] != nil do
        results = json["results"]
        results.each do |x|
          listas_url << x["url"]
        end
        puts json["next"]
        puts "__________________"
        resp = HTTParty.get(json["next"], :headers =>{'Content-Type' => 'application/json'} ).body
        json = JSON.parse(resp)
      end
    json["results"].each do |x|
        listas_url << x["url"]
      end
    return consulta(listas_url, atributo)
  end



def get_id(url)
  id = url.split("/")[-1]
  return id
end




end
