require 'sinatra'
require 'data_mapper'
require 'rack-flash'

enable :sessions
set :session_secret, 'super secret'
set :root, File.join(File.dirname(__FILE__), '..')
set :views, Proc.new { File.join(root, 'app/views/') }
set :public_folder, Proc.new { File.join(root, 'public/') }
use Rack::Flash

require_relative './data_mapper_setup'

require_relative './helpers/application'

require_relative './models/product'

require_relative './controllers/application'