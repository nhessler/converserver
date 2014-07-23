require 'sinatra/base'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'

class Converserver < Sinatra::Base

  get '/hello' do
    'Hello, World'
  end

end

# class ConverserverTest < Minitest::Test

#   def test_it_says_hello
#     skip
#     #talk about how to implement me
#   end
# end

describe Converserver do
  it "says hello" do
    skip
    #talk about how to implement me
  end
end
