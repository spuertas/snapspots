require 'json'
require 'net/http'

# require 'yelp'
require 'bundler'
Bundler.require
require_relative 'models/model.rb'
class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  get '/results' do
    erb :results
  end

  post '/results' do
  # grab user input
    user_location = params[:location]
    user_term = params[:term]
  # define instance variable that will be passed onto our results page
    @finalresults = search(user_term, user_location)
    # hello
    erb :results
  end
end