class Category < ApplicationRecord
  include UniqueNameValidation

  ## Association
  belongs_to :vertical
  has_many :courses

  ## Validation
  validates :name, presence: true, uniqueness: true
  validates :state, presence: true
end
