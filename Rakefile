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
  Category.all.destroy
  StockProduct.all.destroy
  CartProduct.all.destroy
  Product.all.destroy
  category = Category.create(title: 'Footwear')
  category_2 = Category.create(title: 'Formalwear')
  product = Product.create(title: 'Almond Toe Court Shoes', gender: 'Women’s', price: 99, category_id: category.id)
  product_2 = Product.create(title: 'Sharkskin Waistcoat', gender: 'Men’s', price: 50, category_id: category_2.id)
  stock_product = StockProduct.create(product_id: product.id, quantity: 5)
  stock_product_2 = StockProduct.create(product_id: product_2.id, quantity: 8)
end