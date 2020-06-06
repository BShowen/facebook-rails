require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do 
    
    # create 10 users in the DB
    user = User.create!( 
        name: Faker::Name.first_name, 
        email: Faker::Internet.unique.email(domain: "example.com"),
        password: "123123123" 
    )   

    # create 5 posts per user
    5.times do |n|
        user.posts.create! title: "Post #{n} from #{user.name}", body: Faker::ChuckNorris.fact
    end
end

User.all.each do |current_user|
	# make index !=  current user
	user_id = current_user.id
    until user_id != current_user.id do 
        # generate an int to be used as the user_id where int > 0 && int <= total number of users
		user_id = 1 + (rand * User.count).floor
	end

	# get user from the DB so we can post a comment and like a post
    user = User.find_by(id: user_id)

	# make one comment on a random one of their posts
	post_id = (rand * 5).floor
	user.posts[post_id].comments.create!(body: "Comment content. Comment content. Comment content.", author_id: current_user.id) 

	# like a random one of their posts, one time.
	post_id = (rand * 5).floor	
	user.posts[post_id].likes.create!(user_id: current_user.id)

	# become friends with two other users
	# I need to implement this relationship in the DB
end

# post credentials to a profile so I can log in.
puts `clear`
puts "Complete!"
user = User.first
puts "Log in with "
puts "          Email: #{user.email}"
puts "          Password: 123123123"