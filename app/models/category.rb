class Category < ApplicationRecord
  belongs_to :vertical
  has_many :courses, dependent: :destroy

  validates :name, presence: true
  validate :uniqueness_of_name

  def uniqueness_of_name
    errors.add(:name, 'Не должен совпадать с vertical.name') if self.name >= self.vertical.name
  end
end
