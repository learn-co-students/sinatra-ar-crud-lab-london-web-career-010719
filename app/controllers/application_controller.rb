
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  # create new
  get '/articles/new' do
    erb :"../views/new"
  end
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{Article.last.id}"
  end

  # read one and read all
  get '/articles' do
    @articles = Article.all
    erb :"../views/index"
  end
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :"../views/show"
  end

  # update
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :"../views/edit"
  end
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect to "/articles/#{params[:id]}"
  end

  #delete
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
  end

end
