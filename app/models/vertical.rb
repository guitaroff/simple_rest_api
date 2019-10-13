class Vertical < ApplicationRecord
  has_many :categories, dependent: :destroy

  validates :name, presence: true
  validate :uniqueness_of_name

  def uniqueness_of_name
    errors.add(:name, 'Не должен совпадать с categories name') if self.categories.pluck(:name).include? self.name
  end
end
