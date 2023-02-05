# frozen_string_literal: true

require 'sinatra'

get '/' do
  erb :index
end

post '/count' do
  @count = params['text'].split.size
  if @count.zero?
    @error = 'Some input text is required'
    erb :index
  else
    erb :count
  end
end
