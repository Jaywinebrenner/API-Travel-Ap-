class Review < ApplicationRecord
  belongs_to :destination
  scope :author_search, -> (search_parameter) { where("author like ?", "%#{search_parameter}%")}
scope :content_search, -> (search_parameter) { where("content like ?", "%#{search_parameter}%")}
scope :specific_time_search, -> (search_parameter) { where("created_at = ?", "%#{search_parameter}%")}
end
