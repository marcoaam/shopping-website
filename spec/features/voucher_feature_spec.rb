require 'spec_helper'
require_relative './helpers/shopping_cart_helper'

include ShoppingHelper

feature 'Voucher' do

  context 'With some products added to the cart' do

    before(:each) do
      category = Category.create(title: 'Footwear')
      product = Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99, category_id: category.id)
      StockProduct.create(product_id: product.id, quantity: 5)
    end

    scenario 'can apply a 5 off voucher' do
      add_to_shopping_cart(1)
      within('.shopping_cart') do
        expect(page).to have_content 'Total price: £ 99.0'
        fill_in :voucher, with: 'GET5off'
        click_button 'Apply voucher'
      end
      expect(page).to have_content 'Discount: - £ 5'
      expect(page).to have_content 'Total price: £ 94.0'
    end

    scenario 'can apply a 10 off voucher of 50 or more purchases' do
      add_to_shopping_cart(1)
      within('.shopping_cart') do
        expect(page).to have_content 'Total price: £ 99.0'
        fill_in :voucher, with: 'GET10off'
        click_button 'Apply voucher'
      end
      expect(page).to have_content 'Discount: - £ 10'
      expect(page).to have_content 'Total price: £ 89.0'
    end

    scenario 'can apply a 15 off voucher of 75 or more purchases containing Footwear' do
      add_to_shopping_cart(1)
      within('.shopping_cart') do
        expect(page).to have_content 'Total price: £ 99.0'
        fill_in :voucher, with: 'GET15off'
        click_button 'Apply voucher'
      end
      expect(page).to have_content 'Discount: - £ 15'
      expect(page).to have_content 'Total price: £ 84.0'
    end

  end

end