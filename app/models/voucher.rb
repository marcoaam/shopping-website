class Voucher

  include DataMapper::Resource

  property :id,       Serial
  property :session,  Text
  property :amount,   Integer

  GET5OFFVOUCHER  = 'GET5off'
  GET10OFFVOUCHER = 'GET10off'
  GET15OFFVOUCHER = 'GET15off'

  ALL_VOUCHERS_DISCOUNTS = { GET5OFFVOUCHER => 5, 
                            GET10OFFVOUCHER => 10, 
                            GET15OFFVOUCHER => 15 }

  GET_10_VOUCHER_PRICE_REQUIREMENT = 50
  GET_15_VOUCHER_PRICE_REQUIREMENT = 75

  def self.apply_voucher(session, voucher)
    new_voucher = Voucher.first_or_create(session: session)
    new_voucher.amount = get_discount(voucher)
    new_voucher.save
  end

  def self.valid?(session, voucher)
    voucher_5_off_valid?(voucher) || voucher_10_off_valid?(voucher, session) ||
    voucher_15_off_valid?(voucher, session)
  end

  def self.get_if_valid(session)
    voucher = Voucher.first(session: session)
    if !voucher.nil? && Voucher.valid?(session, get_type_of_voucher(voucher.amount))
      return voucher
    else
      voucher.destroy unless voucher.nil?
      return nil
    end
  end

private

  def self.get_discount(voucher)
    ALL_VOUCHERS_DISCOUNTS[voucher]
  end

  def self.get_type_of_voucher(amount)
    ALL_VOUCHERS_DISCOUNTS.key(amount)
  end

  def self.voucher_10_off_valid?(voucher, session)
    (cart_total_price_more_or_equal_to?(GET_10_VOUCHER_PRICE_REQUIREMENT, session)) && (voucher == GET10OFFVOUCHER)
  end

  def self.voucher_5_off_valid?(voucher)
    voucher == GET5OFFVOUCHER
  end

  def self.voucher_15_off_valid?(voucher, session)
    (cart_total_price_more_or_equal_to?(GET_15_VOUCHER_PRICE_REQUIREMENT, session)) && (voucher == GET15OFFVOUCHER) &&
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