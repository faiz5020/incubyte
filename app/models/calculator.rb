class Calculator < ApplicationRecord

  def self.calculate input_string
    if input_string.blank?
      return 0
    else
      if input_string.first(2) == "//"
      elsif input_string.include?("\n")
      else
        str = input_string.split(",")
        str = str.map(&:to_f)
        str.delete(0)
        if str.all?(&:positive?)
          return str.sum.to_i
        else
          return "errorrrr"
        end
      end
    end
  end
end