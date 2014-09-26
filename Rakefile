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
  Voucher.all.destroy
  category = Category.create(title: 'Footwear')
  category_2 = Category.create(title: 'Formalwear')
  category_3 = Category.create(title: 'Casualwear')
  product = Product.create(title: 'Almond Toe Court Shoes, Patent Black', gender: 'Women’s', price: 99, category_id: category.id)
  product_2 = Product.create(title: 'Suede Shoes, Blue', gender: 'Women’s', price: 42, category_id: category.id)
  product_3 = Product.create(title: 'Leather Driver Saddle Loafers, Tan', gender: 'Men’s', price: 34, category_id: category.id)
  product_4 = Product.create(title: 'Flip Flops, Red', gender: 'Men’s', price: 19, category_id: category.id)
  product_5 = Product.create(title: 'Flip Flops, Blue', gender: 'Men’s', price: 19, category_id: category.id)
  product_6 = Product.create(title: 'Gold Button Cardigan, Black', gender: 'Women’s', price: 167, category_id: category_3.id)
  product_7 = Product.create(title: 'Cotton Shorts, Medium Red', gender: 'Women’s', price: 30, category_id: category_3.id)
  product_8 = Product.create(title: 'Fine Stripe Short Sleeve￼Shirt, Grey', gender: 'Men’s', price: 49.99, category_id: category_3.id)
  product_9 = Product.create(title: 'Fine Stripe Short Sleeve Shirt, Green', gender: 'Men’s', price: 39.99, category_id: category_3.id)
  product_10 = Product.create(title: 'Sharkskin Waistcoat,￼Charcoal', gender: 'Men’s', price: 75, category_id: category_2.id)
  product_11 = Product.create(title: 'Lightweight Patch Pocket￼Blazer, Deer', gender: 'Men’s', price: 175.50, category_id: category_2.id)
  product_12 = Product.create(title: 'Bird Print Dress, Black', gender: 'Women’s', price: 270, category_id: category_2.id)
  product_13 = Product.create(title: 'Mid Twist Cut-Out Dress, Pink', gender: 'Women’s', price: 540, category_id: category_2.id)
  StockProduct.create(product_id: product.id, quantity: 5)
  StockProduct.create(product_id: product_2.id, quantity: 4)
  StockProduct.create(product_id: product_3.id, quantity: 12)
  StockProduct.create(product_id: product_4.id, quantity: 6)
  StockProduct.create(product_id: product_5.id, quantity: 0)
  StockProduct.create(product_id: product_6.id, quantity: 6)
  StockProduct.create(product_id: product_7.id, quantity: 5)
  StockProduct.create(product_id: product_8.id, quantity: 9)
  StockProduct.create(product_id: product_9.id, quantity: 3)
  StockProduct.create(product_id: product_10.id, quantity: 2)
  StockProduct.create(product_id: product_11.id, quantity: 1)
  StockProduct.create(product_id: product_12.id, quantity: 10)
  StockProduct.create(product_id: product_13.id, quantity: 5)
end