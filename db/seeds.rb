# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'William Raga', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', email: 'ragawilliam570@gmail.com', bio: 'Teacher from Mexico.', role: 'admin')
second_user = User.create(name: 'Esther Raga', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', email: 'estherraga@gmail.com', bio: 'Teacher from Poland.', role: 'admin')
third_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', email: 'tom@gmail.com', bio: 'Teacher from Mexico.')
fourth_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', email: 'lilly@gmail.com', bio: 'Teacher from Poland.')

# first_post = Post.create(author_id: 1, title: 'Hello', text: 'This is my first post')
# second_post = Post.create(author_id: 1, title: 'Hello', text: 'This is my second post')
# third_post = Post.create(author_id: 1, title: 'Hello', text: 'This is my third post')
# fourth_post = Post.create(author_id: 1, title: 'Hello', text: 'This is my fourth post')
# fifth_post = Post.create(author_id: 1, title: 'Hello', text: 'This is my fifth post')
# sixth_post = Post.create(author_id: 1, title: 'Hello', text: 'This is my sixth post')

# Comment.create(post_id: 1, author_id: 2, text: 'Hi Tom!' )
# Comment.create(post_id: 1, author_id: 3, text: 'Hi Tom!' )
# Comment.create(post_id: 1, author_id: 4, text: 'Hi Tom!' )
# Comment.create(post_id: 1, author_id: 2, text: 'Hi Tom!' )
# Comment.create(post_id: 1, author_id: 1, text: 'Hi world!' )