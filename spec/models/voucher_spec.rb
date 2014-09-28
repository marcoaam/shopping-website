require 'spec_helper'

describe Voucher do

  let(:cart_product) do
    Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99)
    CartProduct.create(session: 'session_1')
  end

  let(:voucher) { double :voucher }

  it 'can apply a voucher' do
    expect(Voucher).to receive(:first_or_create).with(session: 'session_1').and_return voucher
    expect(voucher).to receive(:amount=).with(5)
    expect(voucher).to receive(:save)
    expect(Voucher.apply_voucher('session_1', 'GET5off'))
  end

  it 'knows if the voucher is valid or not' do
    expect(Voucher.valid?('session_1', 'GET5off')).to be true
  end

end