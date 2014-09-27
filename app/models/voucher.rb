class Voucher

  ALL_VOUCHERS = { 'GET5off' => 5, 
                  'GET10off' => 10, 
                  'GET15off' => 15 }

  GET5OFFVOUCHER = 'GET5off'
  GET10OFFVOUCHER = 'GET10off'
  GET15OFFVOUCHER = 'GET15off'

  include DataMapper::Resource

  property :id,       Serial
  property :session, Text
  property :amount,  Integer

  def self.apply_voucher(session, voucher)
    Voucher.create(session: session, amount: get_discount(voucher))
  end

  def self.valid?(voucher, session)
    voucher_5_off_valid?(voucher) || voucher_10_off_valid?(voucher, session) ||
    voucher_15_off_valid?(voucher, session)
  end

private

  def self.get_discount(voucher)
    ALL_VOUCHERS[voucher]
  end

  def self.voucher_10_off_valid?(voucher, session)
    (cart_total_price_more_or_equal_to?(50, session)) && (voucher == GET10OFFVOUCHER)
  end

  def self.voucher_5_off_valid?(voucher)
    voucher == GET5OFFVOUCHER
  end

  def self.voucher_15_off_valid?(voucher, session)
    (cart_total_price_more_or_equal_to?(75, session)) && (voucher == GET15OFFVOUCHER) &&
    any_footwear?(session)
  end

  def self.any_footwear?(session)
    get_cart_products(session).select { |item| item.product.category.title == 'Footwear' }.any?
  end

  def self.get_cart_products(session)
    CartProduct.all(session: session)
  end

  def self.cart_total_price_more_or_equal_to?(amount, session)
    CartProduct.total_price(get_cart_products(session), 0) >= amount
  end

end