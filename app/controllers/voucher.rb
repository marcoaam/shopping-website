GET5OFFVOUCHER = 'GET5off'
GET10OFFVOUCHER = 'GET10off'
GET15OFFVOUCHER = 'GET15off'

post '/apply/voucher/' do
  if voucher_valid?(params[:voucher])
    Voucher.apply_voucher(session[:session_id], params[:voucher])
  else
    flash[:errors] = ['Sorry voucher not valid']
  end
  redirect to '/'
end

def voucher_valid?(voucher)
  voucher_5_off_valid?(voucher) || voucher_10_off_valid?(voucher) ||
  voucher_15_off_valid?(voucher)
end
