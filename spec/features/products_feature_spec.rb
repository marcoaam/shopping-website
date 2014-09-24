require 'spec_helper'

feature 'Products' do

  context 'With some in the DB' do

    before(:each) do
      category = Category.create(title: 'Footwear')
      Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', category_id: category.id )
    end

    scenario 'User can see the title of all available products' do
      visit '/'
      expect(page).to have_content 'Almond Toe Court Shoes'
    end

    scenario 'User can see the catagory to which the product belongs' do
      visit '/'
      expect(page).to have_content 'Women’s Footwear'
    end

  end

end