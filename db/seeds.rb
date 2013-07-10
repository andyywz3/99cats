# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cats = Cat.create([
  { name: 'jonathan', sex: 'male', color: 'red', birthday: Date.new(1990,1,1) },
  { name: 'ke', sex: 'male', color: 'blue', birthday: Date.new(1991,1,1) },
  { name: 'jess', sex: 'female', color: 'green', birthday: Date.new(1993,4,5) },
  ])


  cat_requests = CatRentalRequest.create!([
    {:begin_date => Date.new(2013,1,1), :cat_id => 1,
      :end_date => Date.new(2014,1,1) ,
      :status => "approved"}
  ])