class ListingsController < ApplicationController
  def new
    @listing = Listing.new
    # passing the command to @listing. 
  end
end
