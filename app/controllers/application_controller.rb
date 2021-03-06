require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/posts'
  end

  #CREATE - NEW action
  get '/posts/new' do
    erb :'new.html'
  end

  #CREATE - CREATE action
  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    erb :'show.html'
  end

  #READ - INDEX action for all instances
  get '/posts' do
    @posts = Post.all
    erb :'index.html'
  end

  #READ - SHOW action for specific instance
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'show.html'
  end

  #UPDATE - EDIT action
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'edit.html'
  end

  #UPDATE - UPDATE action
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :'show.html'
    #shortform update
      #@post = Post.find(params[:id])
      #@post.update(name: params[:name], content: params[:content])
  end

  #DELETE - DESTROY action
    #via "form" button on show.html.erb
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :'delete.html'
  end


end
