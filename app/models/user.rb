class User < ApplicationRecord
  include Clearance::User
  has_many :authentications, :dependent => :destroy
  has_many :listings
  has_many :bookings #user can have many booking
#In app/models/user.rb    has_many :authentications, :dependent => :destroy
# create_with_auth_hash will create a User object based on the information given by the provider
# This setup is meant for the user to key in his/her own Facebook password to log in to our app and such that we need not store this user’s password
  def self.create_with_auth_and_hash(authentication, auth_hash)
    create! do |u|
      u.first_name = auth_hash["info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
    #  user = User.create!(first_name: auth_hash["info"]["name"], email: auth_hash["extra"]["raw_info"]["email"])
      u.authentications << (authentication)
      u.password = SecureRandom.hex(7)
   end
    #  auto generate password when you signin with facebook.
    # return user
  end

  def fb_token
   x = self.authentications.where(:provider => :facebook).first
   return x.token unless x.nil?
  end
end
