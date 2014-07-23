require 'sinatra/base'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rack/test'

class Converserver < Sinatra::Base

  get '/hello' do
    say = "Hello"
    say = say + ", #{params[:name]}" if params[:name]

    say
  end

  get '/goodbye/:name' do
    "Goodbye, #{params[:name]}"
  end

  get '/say/:something' do
    say = "#{params[:something]}".gsub('_', ' ')
    say = say + ", #{params[:name]}" if params[:name]

    say
  end
end


describe Converserver do
  include Rack::Test::Methods

  def app
    Converserver.new
  end

  it "says hello" do
    get 'hello'

    assert last_response.ok?
    assert_equal "Hello", last_response.body
  end

  it "says hello to me" do
    get '/hello?name=Nathan'
    # get '/hello', name: "Nathan"
    assert last_response.ok?
    assert_equal "Hello, Nathan", last_response.body
  end

  it "doesn't just say goodbye" do
    get '/goodbye'
    assert last_response.not_found?
  end

  it "says goodbye to me" do
    get '/goodbye/Nathan'
    assert last_response.ok?
    assert_equal "Goodbye, Nathan", last_response.body
  end

  it "says what I want" do
    skip
    #implement me
  end

  it "says what I want to me" do
    skip
    #implement me
  end
end
