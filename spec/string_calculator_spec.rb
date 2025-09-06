require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
  describe ".add" do
    context "Step 1" do
        it "returns 0 for an empty string" do
            expect(StringCalculator.add("")).to eq(0)
        end

        it "returns the number, if only one number is given" do
            expect(StringCalculator.add("1")).to eq(1)
        end

        it "returns the sum of 2 numbers" do
            expect(StringCalculator.add("1,5")).to eq(6)
        end
    end

    context "Step 2" do
        it "should add any amount of numbers" do
            expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
        end
    end
    
    context "Step 3" do
        it "should allow the add method to handle new lines between numbers (instead of commas)" do
            expect(StringCalculator.add("1\n2,3")).to eq(6)
        end
    end

  end
end
