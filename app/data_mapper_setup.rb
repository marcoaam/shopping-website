env = ENV["RACK_ENV"] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/shopping_#{env}")
require_relative './models/product'
require_relative './models/category'
require_relative './models/cart'
DataMapper.finalize