env = ENV["RACK_ENV"] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/shopping_#{env}")
require_relative './models/product'
DataMapper.finalize