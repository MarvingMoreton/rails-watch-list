class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_one_attached :photo
  # ** order matters: put relation with bookmarks before association through
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
end
