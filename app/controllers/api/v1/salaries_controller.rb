class Api::V1::SalariesController < ApplicationController
  def index
    location = params[:location]
    salary = SalaryFacade.salary_data(location)

    render json: SalarySerializer.new(salary)
  end
end