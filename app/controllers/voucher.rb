GET5OFFVOUCHER = 'GET5off'

post '/apply/voucher/' do
  Voucher.create(session: session[:session_id], amount: 5) if params[:voucher] == GET5OFFVOUCHER
  redirect to '/'
end