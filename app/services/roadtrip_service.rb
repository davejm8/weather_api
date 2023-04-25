class RoadtripService

  def self.get_directions(start, finish)
    response = conn.get("optimizedroute?key=#{ENV['MAPQUEST_API_KEY']}&from=#{start}&to=#{finish}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(url: "https://www.mapquestapi.com/directions/v2")
  end
end