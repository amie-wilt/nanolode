# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

require 'faker'

42.times do
  Product.create!({
    :name => Faker::Commerce.product_name,
    :description => Faker::Hacker.say_something_smart,
    :price => Faker::Commerce.price,
    :sku => Faker::Code.ean,
    :remote_image_url => 'http://loremflickr.com/640/480/product'
  })
end
