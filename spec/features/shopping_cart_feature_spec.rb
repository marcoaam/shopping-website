require 'spec_helper'
require_relative './helpers/shopping_cart_helper'

include ShoppingHelper

feature 'Shopping cart' do

  context 'With some products added to the cart' do

    before(:each) do
      category = Category.create(title: 'Footwear')
      product = Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99, category_id: category.id)
      StockProduct.create(product_id: product.id, quantity: 5)
    end

    scenario 'Can sustract one product and adds it to the shopping cart' do
      add_to_shopping_cart(1)
      expect(page).to have_content 'Available: 4'
      within('.shopping_cart') do
        expect(page).to have_content '1 items'
        expect(page).to have_content 'price: £ 99'
      end
    end

    scenario 'Can sustract two products and adds it to the shopping cart' do
      add_to_shopping_cart(2)
      expect(page).to have_content 'Available: 3'
      within('.shopping_cart') do
        expect(page).to have_content '2 items'
      end
    end

    scenario 'Can remove products from the shopping cart' do
      add_to_shopping_cart(2)
      expect(page).to have_content 'Available: 3'
      within('.shopping_cart') do
        expect(page).to have_content '2 items'
        click_link 'Remove'
      end
      expect(page).to have_content '1 items'
      expect(page).to have_content 'Available: 4'
    end

  end

  context 'Without any products added to the cart' do
    scenario 'Shows 0 items and 0 total price' do
      visit '/'
      within('.shopping_cart') do
        expect(page).to have_content 'Total: 0 items'
        expect(page).to have_content 'Total price: £ 0'
      end
    end
  end

end