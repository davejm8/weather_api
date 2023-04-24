class TeleportService

  def self.get_salaries(search)
    response = conn.get("urban_areas/slug:#{search}/salaries")
    JSON.parse(response.body, symbolize_names: true)
  end

private

  def self.conn
    Faraday.new(url: 'https://api.teleport.org/api')
  end
end