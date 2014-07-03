# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Retailer.delete_all
Retailer.create(name: 'Maxi')
Retailer.create(name: 'IGA')
Retailer.create(name: 'Metro')
Retailer.create(name: 'SuperC')
Retailer.create(name: 'Tiger')
