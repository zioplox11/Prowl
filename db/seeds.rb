# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

user1 = User.create(username: 'admin', email: 'admin@admin.com', password: '12345678', password_confirmation: '12345678', admin_status: true)

user2 = User.create(username: 'molly', email: 'molly@molly.com', password: '12345678', password_confirmation: '12345678', admin_status: false)

user3 = User.create(username: 'megan', email: 'megan@megan.com', password: '12345678', password_confirmation: '12345678', admin_status: false)

user4 = User.create(username: 'sarah', email: 'sarah@sarah.com', password: '12345678', password_confirmation: '12345678', admin_status: false)

user5 = User.create(username: 'alison', email: 'alison@alison.com', password: '12345678', password_confirmation: '12345678', admin_status: false, height: '5ft4', body_type: 'slim', diet: 'vegan', smokes: 'never', zodiac_sign: 'Leo', gender: 'female', looking_for: 'dating,friendship,events', self_summary: 'I have been living in NYC for about six years. I am witty, funny, and sometimes wild. I like to laugh and to learn new things', birthdate: '08-01-1988')

user6 = User.create(username: 'gretchen', email: 'gretchen@gretchen.com', password: '12345678', password_confirmation: '12345678', admin_status: false, height: '5ft8', body_type: 'husky', diet: 'anything', smokes: 'socially', gender: 'trans', looking_for: 'dating,friendship,networking', self_summary: 'I have been to every state in the contiguous United States.', birthdate: '03-01-1988')

user7 = User.create(username: 'pauline', email: 'pauline@pauline.com', password: '12345678', password_confirmation: '12345678', admin_status: false, height: '5ft2', body_type: 'athletic', diet: 'vegetarian', smokes: 'never', gender: 'female', looking_for: 'dating,friendship', self_summary: 'I have been living in NYC for about six years. I am witty, funny, and sometimes wild. I like to laugh and to learn new things', birthdate: '08-01-1992', pets: 'have a cat,love dogs')

Photo.delete_all

photo1 = Photo.create(image_url: 'http://i.imgur.com/KOGp5GE.png', description: 'This was taken last year in Hawaii', user_id: user1.id)

photo2 = Photo.create(image_url: 'http://i.imgur.com/KOGp5GE.png', description: 'On my birthday', user_id: user2.id)

photo3 = Photo.create(image_url: 'http://i.imgur.com/KOGp5GE.png', description: 'Ok so I am not the most photogenic', user_id: user3.id)

photo4 = Photo.create(image_url: 'http://i.imgur.com/KOGp5GE.png', description: 'Best day of my life', user_id: user4.id)

photo5 = Photo.create(image_url: 'http://i.imgur.com/KOGp5GE.png', description: 'No one can stop me from smiling', user_id: user5.id)

photo5a = Photo.create(image_url: 'http://i.imgur.com/KOGp5GE.png', description: 'With mom on my birthday this year', user_id: user5.id)

photo6 = Photo.create(image_url: 'http://i.imgur.com/KOGp5GE.png', user_id: user6.id)

photo7 = Photo.create(image_url: 'http://i.imgur.com/KOGp5GE.png', description: 'No comment. LOL.', user_id: user7.id)

photo7a = Photo.create(image_url: 'http://i.imgur.com/KOGp5GE.png', description: 'In Savannah, Georgia', user_id: user7.id)


Message.delete_all

message1 = Message.create(body: 'testing the waters', sender_id: user1.id, recipient_id: user2.id)
message2 = Message.create(body: 'testing the waters again', sender_id: user1.id, recipient_id: user2.id)
message3 = Message.create(body: 'testing the waters yet again', sender_id: user1.id, recipient_id: user2.id)
message4 = Message.create(body: 'hi there', sender_id: user2.id, recipient_id: user1.id)
message5 = Message.create(body: 'good day', sender_id: user3.id, recipient_id: user5.id)
message6 = Message.create(body: 'good day to you', sender_id: user5.id, recipient_id: user3.id)


Post.delete_all

post = Post.create(title: 'selling my couch', body: 'i have a nice couch for sale.', user_id: user4.id)
post1 = Post.create(title: 'yard sale this weekend', body: 'we will have lots of great stuff. stop by.')
post2 = Post.create(title: 'volunteering at the food shelter', body: 'food folks and fun all for a very good cause.')

user6.posts << post1
user3.posts << post2


Interest.delete_all

interest1 = Interest.create(interest: "dating")
interest2 = Interest.create(interest: "hook-ups")
interest3 = Interest.create(interest: "friendship")
interest4 = Interest.create(interest: "networking")
interest5 = Interest.create(interest: "events")

user1.interests << interest1
user2.interests << interest1
user3.interests << interest4
user4.interests << interest5
user5.interests << interest3
user6.interests << interest2
user7.interests << interest2












