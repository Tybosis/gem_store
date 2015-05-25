# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create!(name: 'Malachite', description: 'Malachite is a copper carbonate hydroxide mineral',
                price: 20_000, category: 'common')

Product.create!(name: 'Diamond',
                description: "A diamond is a metastable allotrope of carbon,"\
                " where the carbon atoms are arranged in a variation of the"\
                " face-centered cubic crystal structure called a diamond lattice.",
                price: 50_000, category: 'rare')
