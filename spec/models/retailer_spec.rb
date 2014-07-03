require 'spec_helper'

describe Retailer do
  # Always populate the model with valid data here.
  before { @retailer = Retailer.new(name: "IGA") }
  
  subject { @retailer }
  
  it { should respond_to(:name) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @retailer.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @retailer.name = "a" * 101 }
    it { should_not be_valid }
  end
  
  describe "when retailer contains invalid characters" do
    it "should be invalid" do
      retailers = %w[ttt<t aaa%a zzz?z]
      retailers.each do |invalid_retailer|
        @retailer.name = invalid_retailer
        expect(@retailer).not_to be_valid
      end
    end
  end
  
  describe "when retailer contains valid characters" do
    it "should be valid" do
      retailers = %w[O'Tool Metro La_place www.ttt]
      retailers.each do |valid_retailer|
        @retailer.name = valid_retailer
        expect(@retailer).to be_valid
      end
    end
  end
end
