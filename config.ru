require_relative 'app'

if ENV['SECRET']
  use Rack::Session::Cookie, secret: ENV['SECRET']
else
  use Rack::Session::Cookie
end

use Rack::CommonLogger

run Cuba
