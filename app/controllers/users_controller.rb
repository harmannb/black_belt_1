class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def show
    @user = User.find(params[:id])
    @groups = @user.groups
    @group = Group.find(params[:id])
    @membership = Membership.includes(:group)
  end


  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  private
  def user_params
     params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end
