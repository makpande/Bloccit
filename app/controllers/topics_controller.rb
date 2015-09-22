class TopicsController < ApplicationController

  def index
    @topic = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end
end
