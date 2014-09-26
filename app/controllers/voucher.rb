GET5OFFVOUCHER = 'GET5off'
GET10OFFVOUCHER = 'GET10off'
GET15OFFVOUCHER = 'GET15off'

post '/apply/voucher/' do
  Voucher.create(session: session[:session_id], amount: 5) if voucher_5_off_valid?(params[:voucher])
  Voucher.create(session: session[:session_id], amount: 10) if voucher_10_off_valid?(params[:voucher])
  Voucher.create(session: session[:session_id], amount: 15) if voucher_15_off_valid?(params[:voucher])
  redirect to '/'
end


