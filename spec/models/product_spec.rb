require 'spec_helper'

describe StockProduct do

  let(:product) do
    product = Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99)
    StockProduct.create(product_id: product.id, quantity: 5)
  end

  it 'can remove quantity' do
    product.update_quantity(1)
    expect(product.quantity).to eq 4
  end

  it 'cannot remove quantity if the product has 0 quantity' do
    product.update_quantity(6)
    expect(product.quantity).to eq 5
  end

  it 'cannot take less than 1 to remove quantity' do
    product.update_quantity(-1)
    expect(product.quantity).to eq 5
  end

end