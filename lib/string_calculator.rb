class StringCalculator
    def self.add(num)
        numbers = num.split(",")
        sum = 0
        numbers.each do |num|
            sum = sum + num.to_i
        end
        sum
    end
end
