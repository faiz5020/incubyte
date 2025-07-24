require "rails_helper"

RSpec.describe Calculator do
  describe '.calculate' do

    it 'returns 0 for empty string' do
      expect(Calculator.calculate("")) .to eq(0)
    end

    it 'returns 1 for input "1"' do
      expect(Calculator.calculate("1")).to eq(1)
    end

    it 'returns 6 for input "1,2,3"' do
      expect(Calculator.calculate("1,2,3")).to eq(6)
    end

    it 'returns 6 for input with 0' do
      expect(Calculator.calculate("0,1,2,0,3")).to eq(6)
    end

    it 'returns 6 for input with -0' do
      expect(Calculator.calculate("-0,1,2,-0,3")).to eq(6)
    end

    it 'returns error for input with -2' do
      expect(Calculator.calculate("1,-2,3")).to eq("error -2")
    end

    it 'returns error for input with -2 and -0' do
      expect(Calculator.calculate("0,-0,1,-2,3")).to eq("error -2")
    end

    it 'returns 0 for input "0"' do
      expect(Calculator.calculate("0")).to eq(0)
    end

    it 'returns 0 for input "-0"' do
      expect(Calculator.calculate("-0")).to eq(0)
    end

    it 'returns error for input "-5"' do
      expect(Calculator.calculate("-5")).to eq("error -5")
    end

    it 'returns 0 for mixed 0' do
      expect(Calculator.calculate("0,0,-0")).to eq(0)
    end

    it 'returns 1 for "+1"' do
      expect(Calculator.calculate("+1")).to eq(1)
    end

    it 'returns error for multiple negatives' do
      expect(Calculator.calculate("-1,-1,-3")).to eq("error -1,-1,-3")
    end

    it 'returns 10000 for large numbers' do
      expect(Calculator.calculate("2000,3000,5000")).to eq(10000)
    end

    it 'returns 10 for spaced numbers' do
      expect(Calculator.calculate("1, 2, 3, 4")).to eq(10)
    end

    it 'returns 10 for spaced numbers with trailing and leading spaces' do
      expect(Calculator.calculate(" 1, 2 , 3 , 4 ")).to eq(10)
    end

    it 'returns 10 for extra commas' do
      expect(Calculator.calculate(",,,1,2,,3,,,4,0,,,")).to eq(10)
    end

    it 'returns 7 for decimals' do
      expect(Calculator.calculate("1,2.5,3.5")).to eq(7)
    end

    it 'returns error for negative decimal' do
      expect(Calculator.calculate("1,-2.5,3.5")).to eq("error -2")
    end

    it 'returns 7 for decimals with -0' do
      expect(Calculator.calculate("1,0,-0,2.5,3.5")).to eq(7)
    end

    it 'returns 29 for floating number' do
      expect(Calculator.calculate("2.99,2.99,2.99,2.99,2.99,2.99,2.99,2.99,2.99,2.99")).to eq(29)
    end

    it 'returns 1200000000 for large numbers' do
      expect(Calculator.calculate("100000000,200000000,900000000")).to eq(1200000000)
    end

    it 'handles newline with comma' do
      expect(Calculator.calculate("1\n2,3")).to eq(6)
    end

    it 'handles multiple newlines' do
      expect(Calculator.calculate("1\n2\n3")).to eq(6)
    end

    it 'handles leading and trailing newlines' do
      expect(Calculator.calculate("\n1\n2\n3\n")).to eq(6)
    end

    it 'handles newlines with leading blanks' do
      expect(Calculator.calculate("\n\n2\n3\n\n")).to eq(5)
    end

    it 'handles newline with comma' do
      expect(Calculator.calculate("1\n2\n,3")).to eq(6)
    end

    it 'returns error for newline with comma and negative' do
      expect(Calculator.calculate("1\n-2\n,3")).to eq("error -2")
    end

    it 'returns 3 for input with 0' do
      expect(Calculator.calculate("1\n0\n,0\n2")).to eq(3)
    end

    it 'returns 3 for input with -0' do
      expect(Calculator.calculate("1\n0\n,-0\n2")).to eq(3)
    end

    it 'returns 0 for "0\n-0"' do
      expect(Calculator.calculate("0\n-0")).to eq(0)
    end

    it 'returns 11 for multiple newlines' do
      expect(Calculator.calculate("\n\n\n5\n6")).to eq(11)
    end

    it 'returns 11 for newlines with spaces' do
      expect(Calculator.calculate("\n \n \n5\n6")).to eq(11)
    end

    it 'returns 5 for floating numbers' do
      expect(Calculator.calculate("\n1 \n.5 \n.5\n3")).to eq(5)
    end

    it 'handles custom delimiter ;' do
      expect(Calculator.calculate("//;\n1;2")).to eq(3)
    end

    it 'handles custom delimiter |' do
      expect(Calculator.calculate("//|\n1|2|3|4")).to eq(10)
    end

    it 'handles custom delimiter "jul"' do
      expect(Calculator.calculate("//jul\n1jul2jul4jul4")).to eq(11)
    end

    it 'handles custom delimiter $' do
      expect(Calculator.calculate("//$\n1$2$3")).to eq(6)
    end

    it 'handles custom delimiter . (dot)' do
      expect(Calculator.calculate("//.\n1.2.3.4")).to eq(10)
    end

    it 'handles custom delimiter 7' do
      expect(Calculator.calculate("//7\n17273")).to eq(6)
    end

    it 'handles custom delimiter xz' do
      expect(Calculator.calculate("//xz\n1xz27xz3")).to eq(31)
    end

    it 'handles custom delimiter !-!' do
      expect(Calculator.calculate("//!-!\n1!-!2!-!3,3")).to eq(6)
    end

    it 'handles custom delimiter ! with comma' do
      expect(Calculator.calculate("//!\n1!2!6,4,5")).to eq(9)
    end

    it 'handles custom delimiter \n' do
      expect(Calculator.calculate("//\n\n1\n2")).to eq(3)
    end

    it 'handles custom delimiter ; with \n' do
      expect(Calculator.calculate("//;\n\n1\n2")).to eq(3)
    end

    it 'handles custom delimiter ; with logarithmic number' do
      expect(Calculator.calculate("//;\n1;5e2;3")).to eq(504)
    end

    it 'handles custom delimiter ; with alphanumeric number (2a)' do
      expect(Calculator.calculate("//;\n1;2a;3")).to eq(6)
    end

    it 'handles custom delimiter ; with alphanumeric number (a2)' do
      expect(Calculator.calculate("//;\n1;a2;3")).to eq(4)
    end

    it 'handles custom delimiter ; with trailing and leading whitespace' do
      expect(Calculator.calculate("// ; \n1;2;3")).to eq(6)
    end

    it 'handles custom delimiter ; with leading whitespace' do
      expect(Calculator.calculate("//   ;\n1;2;3")).to eq(6)
    end

    it 'handles custom delimiter ; with trailing whitespace' do
      expect(Calculator.calculate("//;    \n1;2;3")).to eq(6)
    end
  end
end
