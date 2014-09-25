require 'spec_helper'

feature 'Shopping cart' do

  context 'With some products in the DB' do

    before(:each) do
      category = Category.create(title: 'Footwear')
      Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99, quantity: 5, category_id: category.id )
    end

    # scenario 'Can sustract one product when user adds a product to the shopping cart' do
    #   visit '/'
    #   click_button 'Add to cart'
    #   expect(page).to have_content 'Available: 4'
    #   within('.shopping_cart') do
    #     expect(page).to have_content '1 items'
    #     expect(page).to have_content 'total: £ 99'
    #   end
    # end

  end

end