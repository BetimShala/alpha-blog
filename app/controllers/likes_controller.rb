class LikesController < ApplicationController

  def new
   # binding.pry
   @like=Like.new
  end

  def create

   #binding.pry
   @like=Like.new(article_id:params[:article_id],user_id:params[:user_id])
   #binding.pry
   if !(Like.find_by(user_id: params[:user_id], article_id: params[:article_id]))

       if current_user!=Article.find(params[:article_id]).user
          if @like.save
    #        binding.pry
            flash[:success]='Thanks for your support'
            redirect_to article_path(params[:article_id])
          else
            
            render 'new'
          end
       else
          flash[:warning]="You can't like your article"

          redirect_to article_path(params[:article_id])
       end
    else

       flash[:danger]='You liked this article once '
       redirect_to article_path(params[:article_id])      
    end

  end

end