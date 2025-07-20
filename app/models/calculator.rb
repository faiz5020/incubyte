class Calculator < ApplicationRecord

  def self.calculate input_string
    if input_string.blank?
      return 0
    end
  end
end