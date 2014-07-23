require 'sinatra/base'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rack/test'

class Converserver < Sinatra::Base

  get '/hello' do
    'Hello, World'
  end

end


describe Converserver do
  include Rack::Test::Methods

  def app
    Converserver.new
  end

  it "says hello" do
    get '/hello'
    assert_equal 200, last_response.status
    assert last_response.ok?
    assert_equal "Hello, World", last_response.body
  end
end
