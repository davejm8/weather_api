class RoadtripService

  def self.get_directions(origin, desintation)
    response = conn.get("route?key=#{ENV['MAPQUEST_API_KEY']}&from=#{origin}&to=#{desintation}&routeType=fastest")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(url: "https://www.mapquestapi.com/directions/v2")
  end
end