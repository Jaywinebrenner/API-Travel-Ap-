class Destination < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :country, presence: true
  validates :city, presence: true
  scope :search, -> (search_parameter) { where("country like ?", "%#{search_parameter}%")}
scope :city_search, -> (search_parameter) { where("city like ?", "%#{search_parameter}%")}
end
