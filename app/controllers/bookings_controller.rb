class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.product = @product
    if @booking.save
      redirect_to product_booking_path(product[:id], params[:id])
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:id)
  end
end
