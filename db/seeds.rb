# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Slide.destroy_all
ServiceSection.destroy_all
Service.destroy_all
SiteAdmin.destroy_all
Church.destroy_all

Church.create(name: "Soundside Church")

puts "Seeded Churches"

SiteAdmin.create(username: "Jason", password: "JohnCalvin", email: "test1@test.com", church: Church.first)
SiteAdmin.create(username: "Aaron", password: "JohnCalvin", email: "test2@test.com", church: Church.first)
SiteAdmin.create(username: "Jim", password: "JohnCalvin", email: "test3@test.com", church: Church.first)
SiteAdmin.create(username: "Johh", password: "JohnCalvin", email: "test4@test.com", church: Church.first)

puts "Seeded SiteAdmins"

Service.create(date: Time.new(2020, 5, 31), church: Church.first)
Service.create(date: Time.new(2020, 6, 7), church: Church.first)

puts "Seeded Services"

ServiceSection.create(title: "Service Overview", service: Service.first)
ServiceSection.create(title: "Waymaker", service: Service.first)
ServiceSection.create(title: "Scripture Reading", service: Service.first)
ServiceSection.create(title: "Open the Eyes of My Heart", service: Service.first)
ServiceSection.create(title: "10000 Reasons", service: Service.first)
ServiceSection.create(title: "Sermon", service: Service.first)

ServiceSection.create(title: "Service Overview", service: Service.second)
ServiceSection.create(title: "Come Thou Fount, Come Thou King", service: Service.second)
ServiceSection.create(title: "My Lighthouse", service: Service.second)
ServiceSection.create(title: "Scripture Reading", service: Service.second)
ServiceSection.create(title: "Open the Eyes of My Heart", service: Service.second)
ServiceSection.create(title: "Sermon", service: Service.second)

puts "Seeded ServiceSections"

Slide.create(title: nil, content: "Waymaker\nScripture Reading\nOpen the Eyes of My Heart\n10000 Reasons\nMessage from Aaron")
Slide.create(title: nil, content: "You are here, moving in our midst\nI worship You\nI worship You\n(x4)", service_section: ServiceSection.second)
Slide.create(title: nil, content: "And You are\nWay maker, miracle worker,\nPromise keeper\nLight in the darkness\nMy God, that is who You are", service_section: ServiceSection.second)
Slide.create(title: "Revelation 11:16", content: "Then the seventh angel blew his trumpet, and there were loud voices in heaven, saying, “The kingdom of the world has become the kingdom of our Lord and of his Christ, and he shall reign forever and ever.", service_section: ServiceSection.third)

puts "Seeded Slides"






