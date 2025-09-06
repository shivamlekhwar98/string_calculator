class StringCalculator
    def self.add(numbers)
        # empty checking numbers
        return 0 if numbers.empty?

        # checking case for numbers starting with //
        if numbers.start_with?("//")
            delimiter_line, numbers_part = numbers.split("\n", 2)
            delimiter = delimiter_line[2..]
            delimiters = Regexp.new(Regexp.escape(delimiter))
            # splitting numbers with specific delimitor after //
            numbers = numbers_part.split(delimiters)
        else
            # splitting numbers with \n or ,
            numbers = numbers.split(/[\n,]/)
        end

        # filtering negative numbers
        negative_numbers = numbers.select{|n| n.to_i < 0 }

        # if negative numbers are empty, we return the sum of numbers else we raise Argument Error
        if negative_numbers.empty?
            return numbers.map(&:to_i).sum
        else
            raise ArgumentError, "negative numbers not allowed #{negative_numbers.join(',')}"
        end
    end
end