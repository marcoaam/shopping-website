module ShoppingHelper

  def add_to_shopping_cart(amount)
    visit '/'
    fill_in :quantity, with: amount
    click_button 'Add to cart'
  end

end