class RelationshipsController < ApplicationController

  def create
    #binding.pry
    @relationship=Relationship.new(follower_id: params[:follower_id],followed_id: params[:followed_id])
     if !(Relationship.find_by(follower_id: params[:follower_id], followed_id: params[:followed_id]))
        binding.pry
        if @relationship.save
          flash[:success]='Following'
          #binding.pry
          redirect_to user_path(params[:followed_id])
        else
          flash[:success]='Not saved and not following'
          #binding.pry
          redirect_to user_path(params[:followed_id])
        end
     else
       flash[:success]='NOT Following'
       #binding.pry
       redirect_to user_path(params[:followed_id])
     end
  end

end
