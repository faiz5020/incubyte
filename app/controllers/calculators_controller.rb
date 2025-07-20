class CalculatorsController < ApplicationController
  # attr_accessor :input_string
  def add
    input_string = params[:input_string]
    if params[:input_string]
      sum = Calculator.calculate(input_string)
      render json: sum, status: :ok
    else
      render json: "invalid", status: :unprocessable_entity
    end
  end
end