# File:  simple_number.rb

class SimpleNumber

    def initialize(num)
        raise unless num.is_a?(Numeric)
        @x = num
    end

    def add(y)
        @x + y
    end

    def multiply(y)
      @x * y
    end

    def test_value(y)
        if y == 1
            return true
            
        else
            return false
        end
        
    end
end