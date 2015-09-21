class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

#Create new Post
  def create
     @post = Post.new
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]


    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

# Update post
  def update
     @post = Post.find(params[:id])
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]

     if @post.save
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

  # Delete post
  def destroy
   @post = Post.find(params[:id])
   if @post.destroy
     flash[:notice] = "\"#{@post.title}\" was deleted successfully."
     redirect_to posts_path
   else
     flash[:error] = "There was an error deleting the post."
     render :show
   end
 end
end
