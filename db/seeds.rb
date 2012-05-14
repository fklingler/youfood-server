# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


restaurant = Restaurant.create(name: 'YouFood Alsace', address: 'Strasbourg')

zone1 = restaurant.zones.create()
zone2 = restaurant.zones.create()
zone3 = restaurant.zones.create()

table1 = zone1.tables.create(number: 1)
table2 = zone1.tables.create(number: 2)
table3 = zone1.tables.create(number: 3)