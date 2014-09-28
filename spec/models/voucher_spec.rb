require 'spec_helper'

describe Voucher do

  let(:voucher) { double :voucher, amount: 5}

  it 'can apply a voucher' do
    expect(Voucher).to receive(:first_or_create).with(session: 'session_1').and_return voucher
    expect(voucher).to receive(:amount=).with(5)
    expect(voucher).to receive(:save)
    expect(Voucher.apply_voucher('session_1', 'GET5off'))
  end

  it 'knows if the voucher is valid or not' do
    expect(Voucher.valid?('session_1', 'GET5off')).to be true
  end

  it 'can get the voucher only if its valid' do
    expect(Voucher).to receive(:first).with(session: 'session_1').and_return voucher

    expect(Voucher.get_if_valid('session_1')).to eq voucher
  end

  it 'return nil if the voucher is not valid anymore or not present' do
    expect(Voucher).to receive(:first).with(session: 'session_1').and_return nil

    expect(Voucher.get_if_valid('session_1')).to eq nil
  end

  it 'return nil and destroys if the voucher is present but not valid anymore' do
    expect(Voucher).to receive(:first).with(session: 'session_1').and_return voucher
    expect(Voucher).to receive(:valid?).and_return false
    expect(voucher).to receive(:destroy)

    expect(Voucher.get_if_valid('session_1')).to eq nil
  end

end