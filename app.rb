require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'
require 'pg'


class BookmarkManager < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks/new' do
    erb :add_bookmark
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])     
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
