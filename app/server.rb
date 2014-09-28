require 'sinatra'
require 'data_mapper'
require 'dm-aggregates'
require 'rack-flash'
require 'securerandom'

enable :sessions
set :session_secret, 'super secret'
set :root, File.join(File.dirname(__FILE__), '..')
set :views, Proc.new { File.join(root, 'app/views/') }
set :public_folder, Proc.new { File.join(root, 'public/') }
use Rack::Flash

require_relative './data_mapper_setup'

require_relative './models/product'
require_relative './models/category'
require_relative './models/stock_product'
require_relative './models/cart_product'
require_relative './models/voucher'

require_relative './controllers/application'
require_relative './controllers/shopping_cart'
require_relative './controllers/voucher'