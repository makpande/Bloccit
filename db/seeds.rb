 # include RandomData
 #
 #  50.times do
 #    Post.create!(
 #      title: RandomData.random_sentence,
 #      body: RandomData.random_paragraph
 #    )
 #  end
 #  posts = Post.all
 #
 #
 #  100.times do
 #    Comment.create!(
 #      post: posts.sample,
 #      body: RandomData.random_paragraph
 #    )
 #  end
#Post with unique post

  Post.find_or_create_by(title: 'This is my unique title')

  Post.find_or_create_by(title: 'This is my unique title')

  Post.create_with(body: 'This is my unique title body').find_or_create_by(body: 'This is my unique title')

  Post.find_or_create_by(title: 'This is my unique title') do |post|
    post.body = 'This is my unique title body'
  end

  #Comment with unique comment
  #
  Comment.find_or_create_by(body: 'This is my unique comment body')

  Comment.find_or_create_by(body: 'This is my unique comment body')

  Comment.create_with(post: 'This is my unique post').find_or_create_by(body: 'This is my unique comment body')

  Comment.find_or_create_by(body: 'This is my unique comment body') do |comment|
    comment.body = 'This is my unique comment body'
  end

#   puts "Seed finished"
#   puts "#{Post.count} posts created"
#   puts "#{Comment.count} comments created"
