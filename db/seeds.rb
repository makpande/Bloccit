include RandomData


admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )


 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
#Create users

5.times do
   user = User.create!(

   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all

#Create topics

 15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

# Assign User

 user = User.first
 user.update_attributes!(
   email: 'mak_pande@yahoo.com', # replace this with your personal email
   password: 'helloworld'
 )

 #Create posts

 50.times do
    Post.create!(
      user:   RandomData.sample,
      topic:  RandomData.sample,
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph
    )
  end
  posts = Post.all

#Create SponsoredPost

50.times do
   SponsoredPost.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end

#Create Question

  50.times do
    Question.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      resolved: false
    )
  end
  question = Question.all

# Create comments

  100.times do
    Comment.create!(
      post: posts.sample,
      body: RandomData.random_paragraph
    )
  end

#Create advertisements

  50.times do
    Advertisement.create!(
      title: RandomData.random_sentence,
      copy:  RandomData.random_word,
      price: RandomData.rand_price
    )
  end
  advertisement = Advertisement.all


  #Create comments

   100.times do
      Comment.create!(
        user: users.sample,
        post: posts.sample,
        body: RandomData.random_paragraph
      )
    end

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Topic.count} topics created"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"
# #Post with unique post
#
#   Post.find_or_create_by(title: 'This is my unique title')
#
#   Post.find_or_create_by(title: 'This is my unique title')
#
#   Post.create_with(body: 'This is my unique title body').find_or_create_by(body: 'This is my unique title')
#
#   Post.find_or_create_by(title: 'This is my unique title') do |post|
#     post.body = 'This is my unique title body'
#   end
#
#   #Comment with unique comment
#   #
#   Comment.find_or_create_by(body: 'This is my unique comment body')
#
#   Comment.find_or_create_by(body: 'This is my unique comment body')
#
#   Comment.create_with(post: 'This is my unique post').find_or_create_by(body: 'This is my unique comment body')
#
#   Comment.find_or_create_by(body: 'This is my unique comment body') do |comment|
#     comment.body = 'This is my unique comment body'
# end


  #  puts "#{Question.count} question data created"
  #  puts "#{Comment.count} comments created"


#Post with unique post

  # Post.find_or_create_by(title: 'This is my unique title')
  #
  # Post.find_or_create_by(title: 'This is my unique title')
  #
  # Post.create_with(body: 'This is my unique title body').find_or_create_by(body: 'This is my unique title')
  #
  # Post.find_or_create_by(title: 'This is my unique title') do |post|
  #   post.body = 'This is my unique title body'
  # end
  #
  # #Comment with unique comment
  # #
  # Comment.find_or_create_by(body: 'This is my unique comment body')
  #
  # Comment.find_or_create_by(body: 'This is my unique comment body')
  #
  # Comment.create_with(post: 'This is my unique post').find_or_create_by(body: 'This is my unique comment body')
  #
  # Comment.find_or_create_by(body: 'This is my unique comment body') do |comment|
  #   comment.body = 'This is my unique comment body'
  # end

  # puts "Seed finished"
  # puts "#{Advertisement.count} advertisements created"
  # # puts "#{Comment.count} comments created"
