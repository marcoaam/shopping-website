require 'spec_helper'

describe Voucher do

  let(:cart_product) do
    Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99)
    CartProduct.create(session: 'session_1')
  end

  it 'can apply a voucher' do
    expect(Voucher).to receive(:create).with(session: 'session_1', amount: 5)
    expect(Voucher.apply_voucher('session_1', 'GET5off'))
  end

  it 'knows if the voucher is valid or not' do
    expect(Voucher.valid?('session_1', 'GET5off')).to be true
  end

end