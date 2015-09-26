include RandomData

 15.times do
   SponsoredPost.create!(
     title: RandomData.random_sentence,
     body: RandomData.random_paragraph,
     price: 0
     )
 end
 sponsored_posts = SponsoredPost.all
#  15.times do
#   Topic.create!(
#     name:         RandomData.random_sentence,
#     description:  RandomData.random_paragraph
#   )
# end
# topics = Topic.all
# #
# 50.times do
#    Post.create!(
#      topic:  topics.sample,
#      title:  RandomData.random_sentence,
#      body:   RandomData.random_paragraph
#    )
#  end

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

   puts "Seed finished"
  #  puts "#{Topic.count} topics created"
  #  puts "#{Post.count} posts created"
   puts "#{Sponsored_post.count} question data created"
  #  puts "#{Comment.count} comments created"
