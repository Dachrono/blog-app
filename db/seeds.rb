# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Andy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
user2 = User.create(name: 'Carmen', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Venezuela.')
user3 = User.create(name: 'Hernan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Argentina')

post1_1 = Post.create(author: user1, title: 'Hello', text: 'This is my first post')
post2_1 = Post.create(author: user1, title: 'Hello again', text: 'This is my second post')

post1_2 = Post.create(author: user2, title: 'Hello', text: 'This is my first post')
post2_2 = Post.create(author: user2, title: 'Hello again', text: 'This is my second post')
post3_2 = Post.create(author: user2, title: 'Hello again, again', text: 'This is my third post')

post1_3 = Post.create(author: user3, title: 'Hello', text: 'This is my first post')
post2_3 = Post.create(author: user3, title: 'Hello again', text: 'This is my second post')
post3_3 = Post.create(author: user3, title: 'Hello again, again', text: 'This is my third post')
post4_3 = Post.create(author: user3, title: 'Hello again, again, again', text: 'This is my fourth post')

#Comment.create(post: post1, author: user3, text: 'Hi nice!' )
#Comment.create(post: post1_2, author: user1, text: 'Hi interesting!' )
#Comment.create(post: post1_3, author: user2, text: 'Hi awesome!' )