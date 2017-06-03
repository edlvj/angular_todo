class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  
  validates :title, length: { maximum: 50 }, presence: true
end
