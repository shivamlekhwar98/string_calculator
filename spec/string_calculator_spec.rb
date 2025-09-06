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

    context "Step 4" do
        it "should support different delimiters" do
            expect(StringCalculator.add("//;\n1;2")).to eq(3)
        end
    end

    context "Step 5" do
        it "should throw an exception for negative numbers" do
        expect { StringCalculator.add("2,-4,-5") }.to raise_error("negative numbers not allowed -4,-5")
        end
    end
  end
end
