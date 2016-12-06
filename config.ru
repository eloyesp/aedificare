require_relative 'app'

if ENV['SECRET']
  use Rack::Session::Cookie, secret: ENV['SECRET']
else
  warn 'SECRET not avaible, cookies will not be encrypted'
end

use Rack::CommonLogger

run Cuba
