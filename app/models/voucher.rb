class Voucher

  ALL_VOUCHERS = { 'GET5off' => 5, 
                  'GET10off' => 10, 
                  'GET15off' => 15 }


  include DataMapper::Resource

  property :id,       Serial
  property :session, Text
  property :amount,  Integer

  def self.apply_voucher(session, voucher)
    Voucher.create(session: session, amount: get_discount(voucher))
  end

private

  def self.get_discount(voucher)
    ALL_VOUCHERS[voucher]
  end

end