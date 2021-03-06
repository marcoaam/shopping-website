require 'spec_helper'
require_relative './helpers/shopping_cart_helper'

include ShoppingHelper

feature 'Voucher' do

  context 'With some products in the shopping cart' do

    before(:each) do
      category = Category.create(title: 'Footwear')
      product = Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99, category_id: category.id)
      StockProduct.create(product_id: product.id, quantity: 5)
    end

    scenario 'can apply a 5 off voucher' do
      add_to_shopping_cart(1)
      within('.shopping_cart_container') do
        expect(page).to have_content 'Total price: £ 99.0'
        fill_in :voucher, with: 'GET5off'
        click_button 'Apply voucher'
      end
      expect(page).to have_content 'Voucher: £ -5'
      expect(page).to have_content 'Total price: £ 94.0'
    end

    scenario 'can apply a voucher and gets a message of Voucher applied' do
      add_to_shopping_cart(1)
      within('.shopping_cart_container') do
        fill_in :voucher, with: 'GET5off'
        click_button 'Apply voucher'
      end
      expect(page).to have_content 'Voucher applied'
    end

    scenario 'can apply a 10 off voucher of 50 or more purchases' do
      add_to_shopping_cart(1)
      within('.shopping_cart_container') do
        expect(page).to have_content 'Total price: £ 99.0'
        fill_in :voucher, with: 'GET10off'
        click_button 'Apply voucher'
      end
      expect(page).to have_content 'Voucher: £ -10'
      expect(page).to have_content 'Total price: £ 89.0'
    end

    scenario 'can apply a 15 off voucher of 75 or more purchases containing Footwear' do
      add_to_shopping_cart(1)
      within('.shopping_cart_container') do
        expect(page).to have_content 'Total price: £ 99.0'
        fill_in :voucher, with: 'GET15off'
        click_button 'Apply voucher'
      end
      expect(page).to have_content 'Voucher: £ -15'
      expect(page).to have_content 'Total price: £ 84.0'
    end

    scenario 'gets a flash error when wrong voucher applied' do
      add_to_shopping_cart(1)
      within('.shopping_cart_container') do
        fill_in :voucher, with: 'wrongvoucher'
        click_button 'Apply voucher'
      end
      expect(page).to have_content 'Sorry voucher not valid'
    end

    scenario 'Voucher becomes invalid if the products are removed' do
      add_to_shopping_cart(1)
      within('.shopping_cart_container') do
        fill_in :voucher, with: 'GET15off'
        click_button 'Apply voucher'
      end
      expect(page).to have_content 'Voucher applied'

      within('.shopping_cart_container') do
        expect(page).to have_content 'Voucher: £ -15'
        click_link 'Remove'
      end
      expect(page).to have_content 'Voucher: £ -0'
    end

  end

end