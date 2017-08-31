class CommentsController < ApplicationController

  def index
    @comments=Comment.all
  end

  def show
    @comment=Comment.find(params[:id])
  end

  def new
    @comment=Comment.new
  end

  def create
    @comment=Comment.new(comments_params)
    if @comment.save
      #flash[:notice]='Comment is working'
      redirect_to article_path(@comment.article_id)
    else
      binding.pry
      flash[:danger]='Comment is not working'
      redirect_to articles_path
    end

  end

  def delete
    @comment=Comment.find(params[:id])
  end

  def destroy
    @comment=Comment.find(params[:id])
    temp_article_id=@comment.article_id
    @comment.destroy
    redirect_to article_path(temp_article_id)
  end

  private

  def comments_params
    params.require(:comment).permit(:user_id,:article_id,:username,:description)

  end
end
