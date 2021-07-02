# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Group.create(group_name: "girl",group_number: "1")
Group.create(group_name: "boy",group_number: "2")
Group.create(group_name: "baby",group_number: "3")
Group.create(group_name: "information",group_number: "4")

Child.create(name: "[共有事項]",birthday: "Mon, 01 Jan 2001",child_centers_name: "0",
    child_number: "0",group_id: "4",group_number: "4")
    
