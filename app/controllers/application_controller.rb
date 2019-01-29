
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#index
  get '/articles' do
    @articles = Article.all
    erb :index
  end

#new
  get '/articles/new' do
    erb :new
  end

#create
  post '/articles' do
    @articles = Article.create(params[:article])
    redirect "/articles/#{@articles.id}"
  end

#show
  get '/articles/:id' do
    @articles = Article.find(params[:id])
    erb :show
  end

#edit
  get '/articles/:id/edit' do
    @articles = Article.find(params[:id])
    erb :edit
  end

#update
  patch '/articles/:id' do
    @articles = Article.find(params[:id])
    @articles.update(params[:article])
    redirect "/articles/#{@articles.id}"
  end

#destroy
  delete '/articles/:id' do
    Article.find(params[:id]).destroy
    redirect "/articles"
  end


end
