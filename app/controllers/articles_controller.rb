class ArticlesController < ApplicationController
  
  # NEW && CREATE
  def new
   @article=Article.new 
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice]='Article was successfully created'
     redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  # EDIT && UPDATE
  def edit
    @article=Article.find(params[:id])    
  end

  def update
    @article=Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:notice]="Article successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  # INDEX && SHOW
  def index
   @articles=Article.all 
  end

  def show
    @article=Article.find(params[:id])
  end



  private 

  def article_params
    params.require(:article).permit(:title,:description)
  end

end
