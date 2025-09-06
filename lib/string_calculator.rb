class StringCalculator
    def self.add(num)
        return 0 if num.empty?

        if num.start_with?("//")
            delimiter_line, numbers_part = num.split("\n", 2)
            delimiter = delimiter_line[2..]
            delimiters = Regexp.new(Regexp.escape(delimiter))
            numbers = numbers_part.split(delimiters)
        else
            numbers = num.split(/[\n,]/)
        end

        sum = 0
        negative_numbers = []
        numbers.each do |num|
            negative_numbers.push(num) if num.to_i < 0
            sum = sum + num.to_i
        end
        if negative_numbers.empty?
            return sum
        else
            raise ArgumentError, "negative numbers not allowed #{negative_numbers.join(',')}"
        end
    end
end