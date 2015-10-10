class FavoriteMailer < ApplicationMailer
  default from: "mak_pande@yahoo.com"

  def new_comment(user, post, comment)

     headers["Message-ID"] = "<comments/#{comment.id}@maksbloccit.com>"
     headers["In-Reply-To"] = "<post/#{post.id}maksbloccit.com>"
     headers["References"] = "<post/#{post.id}@maksbloccit.herokuapp.com>"

     @user = user
     @post = post
     @comment = comment

     mail(to: user.email, subject: "New comment on #{post.title}")
   end
end
