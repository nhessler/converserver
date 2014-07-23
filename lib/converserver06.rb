require 'sinatra/base'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rack/test'

class Converserver < Sinatra::Base

  get '/hello/:name' do
    redirect to("/say/Hello?name=#{params[:name]}")
  end

  get '/goodbye/:name' do
    redirect to("/say/Goodbye?name=#{params[:name]}")
  end

  get '/say/:something' do
    say = "#{params[:something]}".gsub('_', ' ')
    say = say + ", #{params[:name]}" if params[:name]

    say
  end

  get '/google' do
    redirect "http://google.com"
  end
end


describe Converserver do
  include Rack::Test::Methods

  def app
    Converserver.new
  end

  it "says what I want" do
    get '/say/I_Like_Turing_School'
    assert last_response.ok?
    assert_equal "I Like Turing School", last_response.body
  end

  it "says what I want to me" do
    get '/say/Nice_Beard?name=Nathan'
    assert last_response.ok?
    assert_equal "Nice Beard, Nathan", last_response.body
  end

  it 'says hello to me' do
    get '/hello/Nathan'
    assert_equal 302, last_response.status #redirect
    follow_redirect!
    assert last_response.ok?
    assert_equal "Hello, Nathan", last_response.body
  end

  it 'says goodbye to me' do
    get '/goodbye/Watts'
    assert last_response.redirect?
    follow_redirect!
    assert last_response.ok?
    assert_equal "Goodbye, Watts", last_response.body
    #implement me
  end

  it 'redirects to google' do
    get '/google'
    assert_equal 302, last_response.status #redirect
    assert_equal "http://google.com", last_response.location
  end
end
