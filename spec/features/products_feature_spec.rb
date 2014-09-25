require 'spec_helper'

feature 'Products' do

  context 'With some in the DB' do

    before(:each) do
      category = Category.create(title: 'Footwear')
      product = Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99, category_id: category.id)
      stock_product = StockProduct.create(product_id: product.id, quantity: 5)
    end

    scenario 'Shows the title of all available products' do
      visit '/'
      expect(page).to have_content 'Almond Toe Court Shoes'
    end

    scenario 'Shows the category and gender to which the product belongs' do
      visit '/'
      expect(page).to have_content 'Women’s Footwear'
    end

    scenario 'Shows the product price and available quantity' do
      visit '/'
      expect(page).to have_content '£ 99'
      expect(page).to have_content 'Available: 5'
    end

  end

  context 'With none in the DB' do

    scenario 'Shows a message' do
      visit '/'
      expect(page).to have_content 'No products available at this moment'
    end

  end

end