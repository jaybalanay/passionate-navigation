# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## Create default user
User.create(
  email: 'johndoe@example.com',
  password: 'password'
)

verticals_json_file = File.read(Rails.root.join('db', 'json', 'verticals.json'))
JSON.parse(verticals_json_file).each do |vertical|
  vertical_params = vertical.transform_keys!(&:downcase).symbolize_keys

  Vertical.create(vertical_params)
end

categories_json_file = File.read(Rails.root.join('db', 'json', 'categories.json'))
JSON.parse(categories_json_file).each do |category|
  category_hash   = category.transform_keys!(&:downcase).symbolize_keys
  vertical        = Vertical.find_by(id: category_hash[:verticals])
  category_params = category_hash.except(:verticals)

  category          = Category.new(category_params)
  category.vertical = vertical
  category.save
end

courses_json_file = File.read(Rails.root.join('db', 'json', 'courses.json'))
JSON.parse(courses_json_file).each do |course|
  course_hash   = course.transform_keys!(&:downcase).symbolize_keys
  category      = Category.find_by(id: course_hash[:categories])
  course_params = course_hash.except(:categories)

  course          = Course.new(course_params)
  course.category = category
  course.save
end

## Fix the ID sequence of Postgres.
## This is needed because the json file
## for verticals, categories, courses
## contains id when created
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
