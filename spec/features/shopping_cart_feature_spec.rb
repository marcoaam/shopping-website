require 'spec_helper'

feature 'Shopping cart' do

  context 'With some products in the DB' do

    before(:each) do
      category = Category.create(title: 'Footwear')
      product = Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99, category_id: category.id)
      StockProduct.create(product_id: product.id, quantity: 5)
    end

    scenario 'Can sustract one product and adds it to the shopping cart' do
      visit '/'
      click_button 'Add to cart'
      expect(page).to have_content 'Available: 4'
      within('.shopping_cart') do
        expect(page).to have_content '1 items'
        expect(page).to have_content 'price: £ 99'
      end
    end

    scenario 'Can sustract two products and adds it to the shopping cart' do
      visit '/'
      fill_in :quantity, with: 2
      click_button 'Add to cart'
      expect(page).to have_content 'Available: 3'
      within('.shopping_cart') do
        expect(page).to have_content '2 items'
      end
    end

    scenario 'Can remove products from the shopping cart' do
      visit '/'
      fill_in :quantity, with: 2
      click_button 'Add to cart'
      expect(page).to have_content 'Available: 3'
      within('.shopping_cart') do
        expect(page).to have_content '2 items'
        click_link 'Remove'
      end
      expect(page).to have_content '1 items'
      expect(page).to have_content 'Available: 4'
    end

  end

end