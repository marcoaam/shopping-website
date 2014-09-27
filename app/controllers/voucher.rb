post '/apply/voucher/' do
  if Voucher.valid?(params[:voucher], session[:session_id])
    Voucher.apply_voucher(session[:session_id], params[:voucher])
    flash[:notice] = 'Voucher applied'
  else
    flash[:errors] = ['Sorry voucher not valid']
  end
  redirect to '/'
end
