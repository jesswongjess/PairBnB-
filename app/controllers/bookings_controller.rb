class BookingsController < ApplicationController

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = current_user.bookings.new(booking_params)
    # @booking = new_booking (user can have many booking)
    @booking.listing = @listing
    # one listing can only available for one booking.
    if @booking.save
      # redirect to booking#show
      flash[:success] = "Now you can stay in my house...."
      redirect_to listing_booking_path(@listing, @booking)
    else
      flash[:danger] = "Booking failed!"
    end
  end

  def destroy
  end

  def show
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.find(params[:id])
  end

  def booking_params
      params.require(:booking).permit(:number_guests, :start_date, :end_date)
  end

end
