require 'data_mapper'
require_relative './app/data_mapper_setup'  

task :auto_upgrade do  
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrate do
  DataMapper.auto_migrate!
  puts "Auto-migrate complete (data could have been lost)"
end

task :seed do
  category = Category.create(title: 'Footwear')
  Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99, quantity: 5, category_id: category.id )
end