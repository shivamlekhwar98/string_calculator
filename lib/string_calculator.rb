class StringCalculator
    def self.add(num)
        if num.start_with?("//")
            delimiter_line, numbers_part = num.split("\n", 2)
            delimiter = delimiter_line[2..]
            delimiters = Regexp.new(Regexp.escape(delimiter))
            numbers = numbers_part.split(delimiters)
        else
            numbers = num.split(/[\n,]/)
        end

        sum = 0
        numbers.each do |num|
            sum = sum + num.to_i
        end
        sum
    end
end