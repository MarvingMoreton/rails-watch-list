class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  # ** order matters: put relation with bookmarks before association through
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
end
