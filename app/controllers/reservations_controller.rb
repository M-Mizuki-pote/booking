class ReservationsController < ApplicationController

 def index
  @user=User.find(current_user.id)
  @posts=Post.all
  @reservations=@user.reservations
 end

 def show
  @post=Post.find(params[:reservation][:post_id])
  @reservation=Reservation.new(reservation_params)
  @price=(@post.price).to_i * (@reservation.person).to_i * (@reservation.end_date-@reservation.start_date).to_i
  @days=(@reservation.end_date - @reservation.start_date).to_i
 end

 def create
  @reservation=Reservation.new(reservation_params)
  if @reservation.save
   flash[:notice] = "部屋を予約しました"
   redirect_to "http://localhost:3000"
  else
   render "show"
  end
 end

private

 def reservation_params
  params.require(:reservation).permit(:start_date, :end_date, :person, :post_id, :user_id)
 end
end
