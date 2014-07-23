require 'sinatra/base'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rack/test'

class Converserver < Sinatra::Base

  get '/hello' do
    'Hello, World'
  end

  get '/goodbye' do
    'Goodbye, World'
  end
end


describe Converserver do
  include Rack::Test::Methods

  def app
    Converserver.new
  end

  it "says hello" do
    get '/hello'
    assert last_response.ok?
    assert_equal "Hello, World", last_response.body
  end

  it "says goodbye" do
    get '/goodbye'
    assert last_response.ok?
    assert_equal "Goodbye, World", last_response.body
  end
end
