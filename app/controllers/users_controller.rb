class UsersController < ApplicationController

  def index
   @users = User.all
   @posts = Post.all
  end

 def update
   if @user.update(user_params)
     redirect_to "http://localhost:3000/users/edit"
   else
     render :edit
   end
 end

 def show
   @user = User.find(params[:id])
   @post = Post.new
 end

 private

 def user_params
   params.require(:user).permit(:name, :email, :image)
 end
end
