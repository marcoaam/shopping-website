post '/apply/voucher/' do
  if Voucher.valid?(session[:session_id], params[:voucher])
    Voucher.apply_voucher(session[:session_id], params[:voucher])
    flash[:notice] = 'Voucher applied'
  else
    flash[:errors] = ['Sorry voucher not valid']
  end
  redirect to '/'
end