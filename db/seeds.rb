# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'date'

restaurant = Restaurant.create(name: 'YouFood Alsace', address: 'Strasbourg')

zone1 = restaurant.zones.create(name: 'Zone 1')
zone2 = restaurant.zones.create(name: 'Zone 2')
zone3 = restaurant.zones.create(name: 'Zone 3')

table1 = zone1.tables.create(number: 1)
table2 = zone1.tables.create(number: 2)
table3 = zone1.tables.create(number: 3)

menu = Menu.create(name: 'Test menu')

admin = Employee.create(username: 'admin', password: 'admin', password_confirmation: 'admin') { |employee| employee.is_admin = true }