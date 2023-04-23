class Api::V1::ForecastController < ApplicationController
  def index
    location = MapquestService.get_location(params[:location])
    forecast = ForecastFacade.get_forecast(location[:lat], location[:lng])
    render json: forecast
  end
end