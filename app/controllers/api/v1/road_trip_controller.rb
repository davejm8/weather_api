class Api::V1::RoadTripController < ApplicationController

  def create
    @user = User.find_by(api_key: road_trip_params[:api_key])
    if @user
      trip = RoadtripFacade.get_directions(params[:origin], params[:destination])
      render json: RoadtripSerializer.new(trip), status: 200
    # else
    #   render json: { error: 'Unauthorized' }, status: 401
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end 