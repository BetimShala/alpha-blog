class UsersController < ApplicationController

  before_action :set_user ,:only=>[:edit,:update,:show]
  before_action :require_user,:except=>[:index,:show]
  before_action :require_same_user,only:[:edit,:update]

  def new 
    @user=User.new
  end

  def create
    #binding.pry
    @user = User.new(user_params)
    if @user.save
      flash[:success]="Welcome to the Alpha Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    # @user vjen prej before_action te methodes set_user
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success]='Your account was updated successfully'
      redirect_to articles_path
    else
      render 'edit'
    end  

  end

  def index
    @users=User.paginate(page: params[:page],per_page: 2)
  end

  def show
    @user_articles=@user.articles.order('updated_at ASC').paginate(page: params[:page],per_page:2)
  end

  private
  def user_params
    params.require(:user).permit(:username,:email,:password,:short_bio)
  end

  def set_user
        @user=User.find(params[:id])
  end

  def require_same_user
    if current_user !=@user
       flash[:danger]="You can edit or delete only your account"
      redirect_to root_path
    end
  end
end
