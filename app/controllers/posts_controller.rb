class PostsController < ApplicationController
  def index
    @posts = Post.search(params[:search])
  end

   def show
    @user = User.find(params[:id])
    @posts = @user.posts
   end
 
  def create
   @post = Post.new(params.require(:post).permit(:room_name, :room_profile, :price, :address, :room_image, :user_id))
   if @post.save
    flash[:notice] = "部屋を登録しました"
    redirect_to "http://localhost:3000"
   else
    @user = User.find_by(params[:post][:user_id])
    render "users/show"
   end
  end

  def new
   @post = Post.find(params[:post_id])
   @reservation=Reservation.new
  end
 
   def edit
   end
 
   def update
   end
 
   def destroy
   end
end
