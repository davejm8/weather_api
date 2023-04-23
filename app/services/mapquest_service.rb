class MapquestService
  def self.get_location(location)
    response = Faraday.get('https://www.mapquestapi.com/geocoding/v1/address') do |req|
      req.params['key'] = ENV['MAPQUEST_API_KEY']
      req.params['location'] = location
    end

    data = JSON.parse(response.body, symbolize_names: true)
    latlng = data[:results][0][:locations][0][:latLng]

    { lat: latlng[:lat], lng: latlng[:lng] }
  end
end