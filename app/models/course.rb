class Course < ApplicationRecord
  ## Association
  belongs_to :category

  ## Validation
  validates :name, presence: true, uniqueness: true
  validates :state, presence: true
end
