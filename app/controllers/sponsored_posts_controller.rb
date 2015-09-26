class SponsoredPostsController < ApplicationController

  def show
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def new
    @sponsoredpost = SponsoredPost.new
    @topic = Topic.find(params[:topic_id])
  end

  #Create new Post
  def create
    @sponsoredpost = SponsoredPost.new
    @sponsoredpost.title = params[:sponsored_post][:title]
    @sponsoredpost.body = params[:sponsored_post][:body]
    @sponsoredpost.price = params[:sponsored_post][:price]
    @topic = Topic.find(params[:topic_id])

     @sponsoredpost.topic = @topic

    if @sponsoredpost.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic,@sponsoredpost]
    else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
    end
  end

  def edit
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

# Update post
  def update
     @sponsoredpost = SponsoredPost.find(params[:id])
     @sponsoredpost.title = params[:sponsored_post][:title]
     @sponsoredpost.body = params[:sponsored_post][:body]

     if @sponsoredpost.save
       flash[:notice] = "Sponsored Post was updated."
      #  redirect_to @post
      redirect_to [@topic, @sponsoredpost]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

  # Delete post
  def destroy
   @sponsoredpost = SponsoredPost.find(params[:id])
   if @sponsoredpost.destroy
     flash[:notice] = "\"#{@sponsoredpost.title}\" was deleted successfully."
    #  redirect_to posts_path
    redirect_to @sponsoredpost.topic
   else
     flash[:error] = "There was an error deleting the post."
     render :show
   end
 end
end
