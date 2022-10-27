class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  #shows the form -- new.html.erb
  def new
    @article = Article.new
  end

  #this does not have a view
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      #render :new -- renders the erb file BUT does not call new method
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :body )
  end

end
