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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :body )
  end

end
