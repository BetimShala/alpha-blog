class ArticlesController < ApplicationController
  
  before_action :find_article,:only=>[:edit,:update,:show,:destroy],:except=>[:_newest_article]
  before_action :require_user,:except=>[:index,:show]
  before_action :require_same_user ,only:[:edit,:update,:destroy]
  # NEW && CREATE
  def new
   if logged_in?
     @article=Article.new 
   else
    redirect_to root_path
   end
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user=User.first
    if @article.save
      flash[:success]='Article was successfully created'
     redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  # EDIT && UPDATE
  def edit
  
  end

  def update
   
    if @article.update_attributes(article_params)
      flash[:success]="Article successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  # INDEX && SHOW
  def index
   @articles=Article.paginate(page: params[:page],per_page:5)
 
  end

  def show

  end

  # DELETE && DESTROY

  def delete
    
  end

  def destroy
    if @article.destroy
      flash[:danger]="Article was successfully deleted"
      redirect_to articles_path
    else
      flash[:notice]="Couldn't delete this article,try again!"
      redirect_to articles_path
    end
  end



  private 

  def find_article
    @article=Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description)
  end

  def require_same_user
    if current_user != @article.user
       flash[:danger]="You can edit or delete only your articles"
      redirect_to root_path
    end
  end

end
