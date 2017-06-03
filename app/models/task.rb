class Task < ApplicationRecord
  belongs_to :project
  has_many :comments
  
  validates :title, length: { maximum: 50 }, presence: true
end
