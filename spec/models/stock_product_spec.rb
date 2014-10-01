require 'spec_helper'

describe StockProduct do

  let(:product) do
    product = Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99)
    StockProduct.create(product_id: product.id, quantity: 5)
  end

  let(:out_of_stock_product) do
    product = Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99)
    StockProduct.create(product_id: product.id, quantity: 0)
  end

  let(:cart) { double :cart }

  it 'can remove quantity' do
    expect(CartProduct).to receive(:first_or_create).with(session: 'session_1', product_id: nil).and_return cart
    expect(cart).to receive(:add_to_cart).with(1)
    expect(cart).to receive(:save)

    product.update_quantity(1, 'session_1')
    expect(product.quantity).to eq 4
  end

  it 'cannot remove quantity if the product has 0 quantity' do
    expect(CartProduct).not_to receive(:first_or_create).with(session: 'session_1', product_id: nil)
    product.update_quantity(6, 'session_1')
    expect(product.quantity).to eq 5
  end

  it 'cannot take less than 1 to remove quantity' do
    expect(CartProduct).not_to receive(:first_or_create).with(session: 'session_1', product_id: nil)
    product.update_quantity(-1, 'session_1')
    expect(product.quantity).to eq 5
  end

  it 'adds 1 to product quantity' do
    product.add_to_stock
    expect(product.quantity).to eq 6
  end

  it 'Returns Out of stock if quantity is 0' do
    expect(out_of_stock_product.total_quantity).to eq 'Out of stock'
  end

end