
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #allows uer to *READ* all articles
  get "/articles" do
    @articles = Article.all
    erb :index
  end

  #recives POST request to *CREATE* a new article and then go to it
  post "/articles" do
    article = Article.create(params[:article])
    redirect "/articles/#{article.id}"
  end

  #generate POST request to *CREATE* a new article
  get "/articles/new" do
    erb :new
  end

  #allow a user to *READ* a specific artile
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  #allow a user to *UPDATE* an article
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  #recieves an UPDATE request, executes it and sends the user to the UPDATED article
  patch "/articles/:id" do
    article = Article.find(params[:id])
    article.update(params[:article])
    redirect "/articles/#{article.id}"
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect "/articles"
  end


end
