class Salary
  attr_reader :id, :type, :salaries, :forecast, :city

  def initialize(id= "null", type = "salaries",city, forecast, salaries)
    @id = id
    @type = type
    @salaries = salaries
    @forecast = forecast
    @city = city
  end
end