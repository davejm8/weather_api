class Api::V1::SalariesController < ApplicationController
  def index
    location = params[:destination]
    salary = SalaryFacade.salary_data(location)

    render json: SalariesSerializer.new(salary)
  end
end