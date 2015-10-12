class FavoriteMailer < ApplicationMailer
  default from: "mak_pande@yahoo.com"

  def new_comment(user, post, comment)

     headers["Message-ID"] = "<comments/#{comment.id}@maksbloccit.example>"
     headers["In-Reply-To"] = "<post/#{post.id}maksbloccit.example>"
     headers["References"] = "<post/#{post.id}@maksbloccit.example>"

     @user = user
     @post = post
     @comment = comment

     mail(to: user.email, subject: "New comment on #{post.title}")
   end

   def new_post
    @post = post
    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
