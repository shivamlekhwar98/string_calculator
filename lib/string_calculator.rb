class StringCalculator
    def self.add(numbers)
        return 0 if numbers.empty?

        if numbers.start_with?("//")
            delimiter_line, numbers_part = numbers.split("\n", 2)
            delimiter = delimiter_line[2..]
            delimiters = Regexp.new(Regexp.escape(delimiter))
            numbers = numbers_part.split(delimiters)
        else
            numbers = numbers.split(/[\n,]/)
        end

        negative_numbers = numbers.select{|n| n.to_i < 0 }

        if negative_numbers.empty?
            return numbers.map(&:to_i).sum
        else
            raise ArgumentError, "negative numbers not allowed #{negative_numbers.join(',')}"
        end
    end
end