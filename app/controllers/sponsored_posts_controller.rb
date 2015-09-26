class SponsoredPostsController < ApplicationController
  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @sponsored_post = SponsoredPost.new
  end

  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end
end
