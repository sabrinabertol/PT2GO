class Session < ApplicationRecord
  TIPO = %w[HIIT Strength Weigh_loss Fitness]

  belongs_to :user

  has_many :users, through: :bookings
  has_many :reviews

  validates :name, presence: true
end
