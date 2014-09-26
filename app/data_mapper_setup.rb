env = ENV["RACK_ENV"] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/shopping_#{env}")
DataMapper.auto_migrate!
DataMapper.auto_upgrade!
require_relative './models/product'
require_relative './models/category'
require_relative './models/cart_product'
require_relative './models/stock_product'
require_relative './models/voucher'
DataMapper.finalize