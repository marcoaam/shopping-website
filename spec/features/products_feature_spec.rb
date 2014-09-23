require 'spec_helper'

feature 'Products' do

  context 'With some in the DB' do

    before(:each) do
      Product.create(title: 'Almond Toe Court Shoes')
    end

    scenario 'shows all available products' do
      visit '/'
      expect(page).to have_content 'Almond Toe Court Shoes'
    end

  end
end