require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  
  enable :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Bookmark Manager" 
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    #erb :index
    erb(:'bookmarks/index')
    
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  # delete '/bookmarks/:id' do
  #   connection = PG.connect(dbname: 'bookmark_manager_test')
  #   connection.exec("DELETE FROM bookmarks WHERE id = #{params['id']}")
  #   redirect '/bookmarks'
  # end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  # get '/bookmarks/:id/edit' do
  #   @bookmark_id = params[:id]
  #   erb :'bookmarks/edit'
  # end

  # patch '/bookmarks/:id' do
  #   connection = PG.connect(dbname: 'bookmark_manager_test')
  #   connection.exec("UPDATE bookmarks SET url = '#{params[:url]}', title = '#{params[:title]}' WHERE id = '#{params[:id]}'")
  
  #   redirect('/bookmarks')
  # end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :"bookmarks/edit"
  end






  run! if app_file == $0
end