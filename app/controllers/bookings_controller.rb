class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [ :create]

  def index
    @bookings = policy_scope(Booking)
    @chef_bookings = Booking.joins(:product).where(:products => {:user => current_user})
  end

  def new
    @booking = Booking.new
    authorize @booking
    @product = Product.find(params[:product_id])
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @product = Product.find(params[:product_id])
    @booking.user = current_user
    @booking.product = @product
    @booking.status = false
    @booking.total_price = @product.price * params[:booking][:number_of_covers].to_i
    if @booking.save
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  def toggle_enable_status
    @booking = Booking.find(params[:id])
    @booking.toggle!(:status)
    authorize @booking
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:number_of_covers, :date)
  end
end
