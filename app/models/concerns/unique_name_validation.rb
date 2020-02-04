module UniqueNameValidation
  extend ActiveSupport::Concern

  included do
    validate :unique_name
  end

  def unique_name
    return unless Category.where(name: name).exists? || Vertical.where(name: name).exists?

    errors.add(:name, 'Should be unique among Verticals and Categories')
  end
end
