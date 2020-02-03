class Category < ApplicationRecord
  ## Association
  belongs_to :vertical
  has_many :cources

  ## Validation
  validates :name, presence: true, uniqueness: true
  validates :state, presence: true
end
