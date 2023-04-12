class SharedMovie < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
  validates :title, presence: true
  validates :user, presence: true
end
