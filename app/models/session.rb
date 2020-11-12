class Session < ApplicationRecord
  TIPO = %w[HIIT Strength Weigh_loss Fitness]
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :users, through: :bookings
  has_many :reviews
  has_one_attached :photo
  validates :name, presence: true
end
