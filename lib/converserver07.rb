require 'sinatra/base'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rack/test'
require 'nokogiri'

class Converserver < Sinatra::Base
  get '/say/:phrase' do
    phrase = params[:phrase].gsub('_', ' ')

    case phrase
    when /^Say Something$/i
      erb :say, locals: {
        title: "Say Something",
        video: 'http://youtu.be/VVgixOjGhVU',
        artists: ["Ian Axel", "Chad Vaccarino", "Christina Aguilera"],
        phrase: "I'll say whatever you Want, just dont give up on me!",
        name: params[:name],
        list: ['North Carolina', 'Georgia', 'Ohio', 'Virginia', 'District of Columbia', 'Colorado?']
      }
    when /^Im So Fancy$/i
      erb :say, locals: {
        title: "I'm So Fancy",
        video: 'http://youtu.be/O-zpOMYRi0w',
        artists: ["Iggy Azalea", "Charli XCX"],
        phrase: "Iggy is fancy!, You need to work a bit harder",
        name: params[:name],
        list: [1, 2, 3, 4, 5, 6]
      }
    else
      erb :say, locals: {
        artists: [],
        title: phrase,
        phrase: phrase,
        name: params[:name],
        list: ["foo", "bar", "baz", "qux"]
      }
    end
  end
end

describe Converserver do
  include Rack::Test::Methods

  def app
    Converserver.new
  end

  it "normally says what I want" do
    get '/say/I_Like_Testing_Sinatra'
    html = Nokogiri::HTML(last_response.body)

    assert last_response.ok?
    assert_equal "I Like Testing Sinatra", html.css('title').text
    assert_equal 4, html.css('li').size
    assert_empty html.css('section')
  end

  it "normally says what I want to me" do
    get '/say/Nice_Beard?name=Nathan'
    html = Nokogiri::HTML(last_response.body)

    assert last_response.ok?
    assert_equal "Nice Beard", html.css('title').text
    assert_equal "Nice Beard, Nathan", html.css('h1').text
  end

  it "has a special phrase for \"Say Something\"" do
    get '/say/Say_Something'
    html = Nokogiri::HTML(last_response.body)
    phrase =  "I'll say whatever you Want, just dont give up on me!"


    assert last_response.ok?
    assert_equal 'Say Something', html.css('title').text
    assert_equal phrase, html.css('h1 a').text
  end

  it "links to a video for \"Say Something\"" do
    get '/say/Say_Something'
    html = Nokogiri::HTML(last_response.body)

    assert_equal "http://youtu.be/VVgixOjGhVU", html.at_css("h1 a")['href']
  end

  it 'has an artists section for \"Say Something\"' do
    get '/say/Say_Something'
    html = Nokogiri::HTML(last_response.body)
    section = html.css('section')
    artists = section.css('li').map{ |li| li.text }

    assert_equal "Artists:", section.css('h3').text
    assert_equal 3, artists.size
    assert_includes artists, "Christina Aguilera"
  end

  it "has a special phrase for \"Im So Fancy\"" do
    skip
    get '/say/Im_so_Fancy'
    html = Nokogiri::HTML(last_response.body)
    phrase =  "Iggy is fancy!, You need to work a bit harder"

    #lets write some assertions
  end
end
