#Placeholder for a model

class Article < ActiveRecord::Base

  def intialize (params)
    @title = params[:title]
    @content = params[:content]
  end

end
