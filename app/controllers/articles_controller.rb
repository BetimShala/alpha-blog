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

  # DELETE && DESTROY

  def delete
    
  end

  def destroy
    @article=Article.find(params[:id])
    if @article.destroy
      flash[:notice]="Article was successfully deleted"
      redirect_to articles_path
    else
      flash[:notice]="Couldn't delete this article,try again!"
      redirect_to articles_path
    end
  end



  private 

  def article_params
    params.require(:article).permit(:title,:description)
  end

end
