require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:brownie) {Dessert.new("brownie", 5, :chef)}
  let(:chef) { double("chef") }
  
  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to be_a(Integer)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "not_an_integer", :chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      ingredient = "chocolate"
      brownie.add_ingredient(ingredient)
      expect(brownie.ingredients).to include(ingredient)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "flour", "eggs"]
      ingredients.each { |ingredient| brownie.add_ingredient(ingredient) }
      expect(brownie.ingredients).to eq(ingredients)
      brownie.mix!
      expect(brownie.ingredients).not_to eq(ingredients)
      expect(brownie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      amount = 3
      brownie.eat(amount)
      expect(brownie.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      amount = 10
      expect { brownie.eat(amount) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize).and_return("Chef Bob the Great Baker")
      brownie = Dessert.new("brownie", 5, chef)
      expect(brownie.serve).to include("Chef Bob the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do

    brownie = Dessert.new("brownie", 5, chef)
    expect(chef).to receive(:bake).with(brownie)
    brownie.make_more
    end
  end
end