class Category < ApplicationRecord
  belongs_to :vertical
  has_many :courses, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
