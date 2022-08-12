class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many_attached :photos
  # ** order matters: put relation with bookmarks before association through
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
end
