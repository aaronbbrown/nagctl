require 'sinatra/base'

module Nagctl
  class App < Sinatra::Base
    get '/foo' do
      'Hello world!'
    end
  end
end
