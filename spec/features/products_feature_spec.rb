require 'spec_helper'

feature 'Products' do

  context 'With some in the DB' do

    before(:each) do
      category = Category.create(title: 'Footwear')
      Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99, quantity: 5, category_id: category.id )
    end

    scenario 'User can see the title of all available products' do
      visit '/'
      expect(page).to have_content 'Almond Toe Court Shoes'
    end

    scenario 'User can see the category and gender to which the product belongs' do
      visit '/'
      expect(page).to have_content 'Women’s Footwear'
    end

    scenario 'User can see the product price and available quantity' do
      visit '/'
      expect(page).to have_content '£ 99'
      expect(page).to have_content 'Available: 5'
    end

  end

end