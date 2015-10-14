module UsersHelper

def no_post
  if @user.posts.count == 0
    nopost = "#{@user.name} has not submitted any Posts yet."
  end
end

end
