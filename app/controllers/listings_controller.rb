class ListingsController < ApplicationController

  def index
    @listing = listing.all
  end

  def new
    @listing = Listing.new
    # Listing.new (calling method from model Listing)
    # passing the command to @listing.
  end

  def create
    @listing = current_user.listings.new(listing_params)
    # @lising is
    if @listing.save
      # redirect_to @listing
      redirect_to listing_path(@listing)
      # redirect_to "listings/#{@listing.id}"
    else
      redirect_to listing_path
    end
  end


  def show
    @listing = Listing.find(params[:id])
    @booking = @listing.bookings.new
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      flash[:success] = "listed updated!"
    else
      flash[:danger] = "Somethings wrong?"
    end
  end


  def find_listing
    @listing = listing.find(param[:id])

  end

  private
  # that activate params
  def listing_params
      params.require(:listing).permit(:title, :description, :property_type, :room_type, :guest, :bedroom, :bethroom, :price, :address)
      # what is this line ?
      # 'permit' allow the items above to show as per schema. Anything other than that will not be shown.
  end
end
