env = ENV["RACK_ENV"] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/shopping_#{env}")

DataMapper.finalize