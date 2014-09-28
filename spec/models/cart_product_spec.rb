require 'spec_helper'

describe CartProduct do

  let(:cart_product) do
    Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99)
    CartProduct.create(session: 'session_1')
  end

  let(:stock_product)  { double :stock_product, price: 99 }
  let(:products)       { double :group_products, map: [99], none?: false, product: stock_product, quantity: 1 }
  let(:empty_products) { double :group_products, none?: true }

  it 'can add a product' do
    cart_product.add_to_cart(1)
    
    expect(cart_product.quantity).to eq 1
  end

  it 'can remove a product from cart' do
    cart_product.add_to_cart(1)

    expect(cart_product).to receive(:destroy)
    expect(StockProduct).to receive(:first).with(product_id: nil).and_return stock_product
    expect(stock_product).to receive(:add_to_stock)
    expect(stock_product).to receive(:save)

    cart_product.delete_from_cart
  end

  it 'calculates the total price of a group of products' do
    expect(CartProduct.total_price(products, 5)).to eq 94
  end

  it 'calculates the total price to 0 if the group of products is empty' do
    expect(CartProduct.total_price(empty_products, 0)).to eq 0
  end

  it 'calculates the total number of items of a group of products' do
    expect(products).to receive(:sum).with(:quantity).and_return 1

    expect(CartProduct.total_items(products)).to eq 1
  end

end