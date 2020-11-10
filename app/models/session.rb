class Session < ApplicationRecord
  belongs_to :user

  has_many :users, through: :bookings 
  has_many :reviews
    
  validates :name, presence: true, uniqueness: true



end
