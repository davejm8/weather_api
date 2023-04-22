class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastSerializer.new(forecast), status: :ok
  end
end