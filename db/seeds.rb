# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

user1 = VanillaUser.create(username: 'admin', email: 'admin@admin.com', password: '12345678', password_confirmation: '12345678', admin_status: true)

user2 = VanillaUser.create(username: 'molly', email: 'molly@molly.com', password: '12345678', password_confirmation: '12345678', admin_status: false)

user3 = VanillaUser.create(username: 'megan', email: 'megan@megan.com', password: '12345678', password_confirmation: '12345678', admin_status: false)

user4 = VanillaUser.create(username: 'sarah', email: 'sarah@sarah.com', password: '12345678', password_confirmation: '12345678', admin_status: false)

user5 = VanillaUser.create(username: 'alison', email: 'alison@alison.com', password: '12345678', password_confirmation: '12345678', admin_status: false, height: '5ft4', body_type: 'slim', diet: 'vegan', smokes: 'never', zodiac_sign: 'Leo', gender: 'female', looking_for: 'dating,friendship,events', self_summary: 'I have been living in NYC for about six years. I am witty, funny, and sometimes wild. I like to laugh and to learn new things', birthdate: '08-01-1988')

user6 = VanillaUser.create(username: 'gretchen', email: 'gretchen@gretchen.com', password: '12345678', password_confirmation: '12345678', admin_status: false, height: '5ft8', body_type: 'husky', diet: 'anything', smokes: 'socially', gender: 'trans', looking_for: 'dating,friendship,networking', self_summary: 'I have been to every state in the contiguous United States.', birthdate: '03-01-1988')

user7 = VanillaUser.create(username: 'pauline', email: 'pauline@pauline.com', password: '12345678', password_confirmation: '12345678', admin_status: false, height: '5ft2', body_type: 'athletic', diet: 'vegetarian', smokes: 'never', gender: 'female', looking_for: 'dating,friendship', self_summary: 'I have been living in NYC for about six years. I am witty, funny, and sometimes wild. I like to laugh and to learn new things', birthdate: '08-01-1992', pets: 'have a cat,love dogs')

user8 = VanillaUser.create(username: 'georgia', email: 'georgia@georgia.com', password: '12345678', password_confirmation: '12345678', admin_status: false, height: '5ft5', body_type: 'buff', diet: 'anything goes', smokes: 'sometimes', gender: 'trans', looking_for: 'dating,friendship,community building,family', birthdate: '08-01-1985', pets: 'have a bird,love cats')

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

photo8 = Photo.create(image_url: 'http://i.imgur.com/KOGp5GE.png', description: 'No comment. LOL.', user_id: user8.id)

photo8a = Photo.create(image_url: 'http://i.imgur.com/KOGp5GE.png', description: 'In Savannah, Georgia', user_id: user8.id)


Message.delete_all

message1 = Message.create(body: 'testing the waters', sender_id: user1.id, recipient_id: user2.id)
message2 = Message.create(body: 'testing the waters again', sender_id: user1.id, recipient_id: user2.id)
message3 = Message.create(body: 'testing the waters yet again', sender_id: user1.id, recipient_id: user2.id)
message4 = Message.create(body: 'hi there', sender_id: user2.id, recipient_id: user1.id)

message5 = Message.create(body: 'good day', sender_id: user3.id, recipient_id: user5.id)
message6 = Message.create(body: 'good day to you', sender_id: user5.id, recipient_id: user3.id)


ProfileView.delete_all


view1 = ProfileView.create(viewer_id: user1.id, viewed_id: user7.id)
view2 = ProfileView.create(viewer_id: user1.id, viewed_id: user4.id)
view3 = ProfileView.create(viewer_id: user1.id, viewed_id: user2.id)
view4 = ProfileView.create(viewer_id: user7.id, viewed_id: user1.id)
view5 = ProfileView.create(viewer_id: user7.id, viewed_id: user2.id)
view6 = ProfileView.create(viewer_id: user2.id, viewed_id: user3.id)
view7 = ProfileView.create(viewer_id: user3.id, viewed_id: user2.id)
view8 = ProfileView.create(viewer_id: user5.id, viewed_id: user6.id)
view9 = ProfileView.create(viewer_id: user5.id, viewed_id: user3.id)
view10 = ProfileView.create(viewer_id: user5.id, viewed_id: user1.id)
view11 = ProfileView.create(viewer_id: user3.id, viewed_id: user5.id)



Post.delete_all

post = Post.create(title: 'selling my couch', body: 'i have a nice couch for sale.', user_id: user4.id, posting_category: 'community')
post1 = Post.create(title: 'yard sale this weekend', body: 'we will have lots of great stuff. stop by.', posting_category: 'community')
post2 = Post.create(title: 'volunteering at the food shelter', body: 'food folks and fun all for a very good cause.', posting_category: 'community')
post3 = Post.create(title: 'moms meet up', body: 'i was thinking it would be cool for moms in sunset park to meet up and talk about their experience', posting_category: 'family')
post4 = Post.create(title: 'thinking about starting a family', body: 'any moms out there? i am thinking about starting a family with my aprtner.', posting_category: 'family')
post5 = Post.create(title: 'best baby formula', body: 'i am not able to breast feed my child due to a medical condition. anyone out there have any thoughts on best formulas? message me!',posting_category: 'family')

user6.posts << post1
user3.posts << post2
user3.posts << post3
user5.posts << post4
user7.posts << post5


Interest.delete_all

interest1 = Interest.create(interest: "dating")
interest2 = Interest.create(interest: "flings")
interest3 = Interest.create(interest: "friends")
interest4 = Interest.create(interest: "activity partners")
interest5 = Interest.create(interest: "family & kids")
interest6 = Interest.create(interest: "community building")

user1.interests << interest1
user2.interests << interest1
user3.interests << interest4
user4.interests << interest5
user5.interests << interest3
user6.interests << interest2
user7.interests << interest2
user8.interests << interest6












