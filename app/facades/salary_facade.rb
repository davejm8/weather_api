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

    job_titles = [
      "Data Analyst",
      "Data Scientist",
      "Mobile Developer",
      "QA Engineer",
      "Software Engineer",
      "Systems Administrator",
      "Web Developer"
    ]

    
    salaries = salary_data[:salaries].map do |sal|
      if job_titles.include?(sal[:job][:title])
        {
          title: sal[:job][:title],
          min: sal[:salary_percentiles][:percentile_25].round(2),
          max: sal[:salary_percentiles][:percentile_75].round(2),
        }
      end
    end.compact
    
    
    Salary.new(city, forecast, salaries)
  end
end