FactoryBot.define do
  factory :course do
    sequence(:name) { |n| "Course ##{n}" }
    author { 'David Dobrik' }
    state { 'active' }
    category
  end
end
