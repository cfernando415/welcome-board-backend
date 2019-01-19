# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mod.destroy_all
User.destroy_all

Mod.create({ rank: 1 })
Mod.create({ rank: 2 })
Mod.create({ rank: 3 })
Mod.create({ rank: 4 })
Mod.create({ rank: 5 })

User.create({full_name: "Rob Chen", mod_id: Mod.find_by(rank: 4).id, password: "password"})
User.create({full_name: "Carlo Fernando", mod_id: Mod.find_by(rank: 4).id, password: "password"})
User.create({full_name: "Terrance Rose", mod_id: Mod.find_by(rank: 4).id, password: "password"})
User.create({full_name: "LaTarisha Fountain", mod_id: Mod.find_by(rank: 4).id, password: "password"})
User.create({full_name: "Amir Safoev", mod_id: Mod.find_by(rank: 4).id, password: "password"})
User.create({full_name: "Brian Horowitz", mod_id: Mod.find_by(rank: 4).id, password: "password"})
User.create({full_name: "Raquel Randall", mod_id: Mod.find_by(rank: 4).id, password: "password"})
User.create({full_name: "Naomi Joyce Baisa", mod_id: Mod.find_by(rank: 4).id, password: "password"})
User.create({full_name: "Sanjay Sai", mod_id: Mod.find_by(rank: 4).id, password: "password"})
User.create({full_name: "Ommar Azzat", mod_id: Mod.find_by(rank: 4).id, password: "password"})

puts "done"