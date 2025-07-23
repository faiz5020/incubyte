class Calculator
  DELIMETER_REGEX = %r{\A//(.+)\n}

  def self.calculate input_string
    return 0 if input_string.blank?
    delimiter = get_delimiter(input_string)
    normalized_string = normalize_input(input_string, delimiter)
    extracted_numbers = extract_numbers(normalized_string, delimiter)
    invalid_numbers = invalid_numbers(extracted_numbers)
    return "error #{invalid_numbers.join(",")}" if invalid_numbers.count > 0
    calculate_sum(extracted_numbers)
  end

private

  def self.get_delimiter input_string
    match = input_string.match(DELIMETER_REGEX)
    match ? match[1].strip : ","
  end

  def self.normalize_input input_string, delimiter
    input_string.sub(DELIMETER_REGEX, "").gsub("\n", delimiter)
  end

  def self.extract_numbers string, delimeter
    string.split("#{delimeter}").map(&:to_f)
  end

  def self.invalid_numbers extracted_numbers
    extracted_numbers.select { |num| num < 0 }.map(&:to_i)
  end

  def self.calculate_sum(extracted_numbers)
    extracted_numbers.sum.to_i
  end
end