class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, -> { order(priority: :asc) }, dependent: :destroy
  validates :title, length: { maximum: 50 }, presence: true
end
