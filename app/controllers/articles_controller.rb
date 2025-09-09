class ArticlesController < ApplicationController
def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  
def create
  @article = Article.new(params.require(:article).permit(:name, :description))
  if @article.save
    flash[:success] = "Article successfully created"
    redirect_to @article
  else
    puts @article.errors.full_messages  
    
    render 'new', status: :unprocessable_entity 
  end
end


 def update
  @article = Article.find(params[:id])
  if @article.update(params.require(:article).permit(:name, :description))
    flash[:success] = "Article was successfully updated"
    redirect_to @article
  else
    puts @article.errors.full_messages
   
    render 'edit',status: :unprocessable_entity
  end
end


def destroy
  @article = Article.find(params[:id])
  @article.destroy
   redirect_to article_path
  flash[:success] = "Article deleted successfully"
 
end
end
