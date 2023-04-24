class TeleportService

  def self.get_city(search)
    response = conn.get("https://api.teleport.org/api/cities/?search=#{search}")
    parse(response)
  end

  # def self.get_city_info(search)
  #   response = Faraday.get(get_city(search))
  #   parse(response)
  # end

  def self.get_salaries(search)
    response = conn.get("urban_areas/slug:#{search}/salaries")
    # require 'pry'; binding.pry
    parse(response)
  end

private

  def self.conn
    Faraday.new(url: 'https://api.teleport.org/api')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end