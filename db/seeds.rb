include RandomData

# Create Users
 5.times do
   user = User.create!(
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all
 15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Posts
 50.times do
   Post.create!(
     user:   users.sample,
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 user = User.first
  user.update_attributes!(
    email: 'mak_pande@yahoo.com', # replace this with your personal email
    password: 'helloworld'
  )

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Topic.count} topics created"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"
# 50.times do
#    SponsoredPost.create!(
#      topic:  topics.sample,
#      title:  RandomData.random_sentence,
#      body:   RandomData.random_paragraph
#    )
#  end
  # 50.times do
  #   Question.create!(
  #     title: RandomData.random_sentence,
  #     body: RandomData.random_paragraph,
  #     resolved: false
  #   )
  # end
  # question = Question.all
#
#
  # 100.times do
  #   Comment.create!(
  #     post: posts.sample,
  #     body: RandomData.random_paragraph
  #   )
  # end
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

  # 50.times do
  #   Advertisement.create!(
  #     title: RandomData.random_sentence,
  #     copy:  RandomData.random_word,
  #     price: RandomData.rand_price
  #   )
  # end
  # advertisement = Advertisement.all

  # 100.times do
  #   Comment.create!(
  #     post: posts.sample,
  #     body: RandomData.random_paragraph
  #   )
  # end
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
