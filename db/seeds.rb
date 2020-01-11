# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Status.create(id: 0, name: 'Open')
Status.create(id: 1, name: 'Occupied')
Status.create(id: 2, name: 'Move Out Pending')
Status.create(id: 3, name: 'Move In Pending')
