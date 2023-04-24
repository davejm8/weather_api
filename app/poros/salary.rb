class Salary
  attr_reader :id, :type, :salary_data, :forecast, :city

  def initialize(id= "null", type = "salaries",city, forecast, salary_data)
    @id = id
    @type = type
    @salary_data = salary_data
    @forecast = forecast
    @city = city
  end
end