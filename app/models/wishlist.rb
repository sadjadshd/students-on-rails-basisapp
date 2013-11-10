class Wishlist < ActiveRecord::Base
  has_many :wishes
  belongs_to :user
end
