class PostsController < ApplicationController
  # def index
  #   @post = Post.all
  # end
  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: [:show, :new, :create]
  # before_action :authorize_moderator, except: [:show, :update]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
  end

  #Create new Post
  def create
    @post = Post.new
    # @post.title = params[:post][:title]
    # @post.body = params[:post][:body]
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user
    # @post.topic = @topic

    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = "Post was saved."
      redirect_to [@topic,@post]
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
    #  @post.title = params[:post][:title]
    #  @post.body = params[:post][:body]
    @post.assign_attributes(post_params)
    @post.user == current_user
     if @post.save
       @post.labels = Label.update_labels(params[:post][:labels])
       flash[:notice] = "Post was updated."
      #  redirect_to @post
      redirect_to [@topic, @post]
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
    #  redirect_to posts_path
    redirect_to @post.topic
   else
     flash[:error] = "There was an error deleting the post."
     render :show
   end
  end

  def authorize_user
    @post = Post.find(params[:id])
    unless current_user == @post.user || current_user.admin? || current_user.moderator?
      flash[:error] = "You must be an admin to do that."
      redirect_to [@topic, @post]
    end
  end

  # def authorize_moderator
  #   # @post = Post.find(params[:id])
  #   unless current_user == @post.user || current_user.moderator?
  #     flash[:error] = "You must be an moderator or admin to do that."
  #     redirect_to [@topic, @post]
  #   end
  # end


   private
     def post_params
       params.require(:post).permit(:title, :body)
     end

end
