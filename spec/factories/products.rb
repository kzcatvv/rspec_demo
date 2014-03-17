# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "test_product"
    img_url "test_url"
    price "9.99"
	
	factory :update_product do
		name "update_product"
		img_url "update_url"
		price "5.2"
	end

	factory :invalid_product do
	  name "invalid_product"
	  price "abc"
	end
  end

end
