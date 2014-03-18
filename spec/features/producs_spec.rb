require 'spec_helper'

feature 'Product management' do

	scenario "adds a new product", js: true do
		visit products_path
		expect{
			click_link 'New Product'
			fill_in 'Name', with: 'feature_product'
			fill_in 'Img url', with: 'feature_url'
			fill_in 'Price', with: 2.8
			click_button 'Create Product'
		}.to change(Product, :count).by(1)

		expect(page).to have_content 'Product was successfully created'
		expect(page).to have_content 'feature_product'
		expect(page).to have_content 'feature_url'
		expect(page).to have_content '2.8'

		click_link 'Back'
		within 'h1' do	
			expect(page).to have_content 'Listing products'
		end
		expect(current_path).to eq products_path

		save_and_open_page
	end
end
