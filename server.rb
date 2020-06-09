require 'sinatra'
require 'json'
load 'anagram_engine.rb'

get '/?' do
  erb :index
end

get '/api/:sentence/?' do
  return JSON.unparse((AnagramEngine.new).find_anagrams_for(params[:sentence])) if params[:sentence].length <= 30
  return JSON.unparse([["Setning of löng,", " mest 30 stafir"]]) if params[:sentence].length > 30
end
