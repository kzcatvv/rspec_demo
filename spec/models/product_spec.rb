require 'spec_helper'

describe Product do
	describe "filter name by letter" do
		before :each do
			@product_1 = Product.create(name: "C001", price: 7.3)
			@product_2 = Product.create(name: "D001", price: 6)
			@product_3 = Product.create(name: "C002", price: 2)
			@product_4 = Product.create(name: "A001", price: 4.9)
		end

		context "matching letters" do
			it "returns a sorted array of results that match" do
				expect(Product.by_letter("C")).to eq [@product_3, @product_1]
			end
		end

		context "non-matching letters" do
			it "only returns contacts with the provided starting letter" do
				expect(Product.by_letter("D")).to_not include @product_4
			end
		end
	end

	it "is valid with a name, img_url and price" do
		product = Product.new(
			name: "product1",
			img_url: "http://www.baidu.com/1.gif",
			price: 2.5)
		expect(product).to be_valid
	end

	it "is valid with a name and price" do
		product = Product.new(
			name: "product1",
			img_url: nil,
			price: 2.5)
		expect(product).to be_valid
	end

	it "is invalid without a name" do 
		expect(Product.new(name: nil)).to have(1).errors_on(:name)
	end

	it "is invalid without a price" do 
		expect(Product.new(price: nil)).to have(1).errors_on(:price)
	end

	it "is invalid when the price is not number" do 
		expect(Product.new(name: "product1", price: "a")).to have(1).errors_on(:price)
	end

	it "should return the product info include name and price" do
		product = Product.new(
			name: "test_product",
			price: 2.1)
		expect(product.info).to eq "test_product $2.1"
	end
end
