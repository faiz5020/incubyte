class CalculatorsController < ApplicationController
  # attr_accessor :input_string
  def add
    begin
      input_string = params[:input_string]
      if params[:input_string]
        sum = Calculator.calculate(input_string)
        if sum.class == Integer
          render json: sum, status: :ok
        else
          render json: {error: "errorrrr"}, status: :ok
        end
      else
        render json: "invalid", status: :unprocessable_entity
      end
    rescue
    end
  end
end