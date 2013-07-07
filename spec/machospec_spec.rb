require_relative '../lib/machospec'

describe "Testing Framework" do
  describe ".should_equal" do
    it "don't raise an exception if its true" do
      exception = nil
      begin
        4.should_equal 4
      rescue => e
        exception = e
      end
      exception.should_be_nil
    end

    it "raises and exeption if its not true" do
      exception = nil
      begin
        4.should_equal 6
      rescue => e
        exception = e
      end
      exception.should_not_be_nil
    end
  end
end
