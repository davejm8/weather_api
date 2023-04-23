class Api::V1::ForecastController < ApplicationController
  def index
    location = params[:location]
    forecast = ForecastFacade.get_forecast(location)
    
    render json: ForecastSerializer.new(forecast)
  end
end