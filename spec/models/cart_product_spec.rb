require 'spec_helper'

describe CartProduct do

  let(:cart_product) do
    Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99)
    CartProduct.create(session: 'session_1')
  end

  it 'can add a product' do
    cart_product.add_to_cart(1)
    expect(cart_product.quantity).to eq 1
  end

  it 'can remove a product from cart' do
    cart_product.add_to_cart(1)
    expect(cart_product).to receive(:destroy)
    cart_product.delete_from_cart
  end

end