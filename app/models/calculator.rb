class Calculator < ApplicationRecord

  def self.calculate input_string
    if input_string.blank?
      return 0
    else
      if input_string.first(2) == "//"
      elsif input_string.include?("\n")
        string_w_new_line = input_string.split("\n").join(",")
        calculate_sum(string_w_new_line)
      else
        calculate_sum(input_string)
      end
    end
    if @str.all?(&:positive?)
      return @str.sum.to_i
    else
      return "errorrrr"
    end
  end

private
  def self.calculate_sum input_string
    @str = input_string.split(",")
    @str = @str.map(&:to_f)
    @str.delete(0)
  end
end