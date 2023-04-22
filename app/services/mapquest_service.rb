class MapquestService
  def get_location(location)
    response = conn.get("address?key=#{ENV['MAPQUEST_API_KEY']}&location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(url:"https://www.mapquestapi.com/geocoding/v1")
  end
end