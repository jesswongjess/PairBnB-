class Listing < ApplicationRecord
  belongs_to :user #listing table is belong_to user
  has_many :tags, through: :listing_tags, dependent: :destroy
  has_many :listing_tags, :dependent => :destroy
  has_many :bookings 
  # one user can have many tags, listing_tag is the middle table to connect both table.
  # destroy is when user delete certain tags, it will be deleted entirely.


end
