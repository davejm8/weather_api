class SalaryFacade
  def self.salary_data(location)
    salary_data = TeleportService.get_salaries(location)
    forecast = ForecastFacade.get_forecast(location)
    city = {
      destination: location
    }
    
    forecast = { 
      summary: forecast.current_weather[:condition],
      temperature: forecast.current_weather[:temperature] 
    }
    
    salary_data = salary_data[:salaries].map do |salary|
      {
        title: salary[:job][:title],
        min: salary[:salary_percentiles][:percentile_25],
        max: salary[:salary_percentiles][:percentile_75],
      }
    end
    
    
    Salary.new(city, forecast, salary_data)
  end
end