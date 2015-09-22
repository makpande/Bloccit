class QuestionController < ApplicationController
  def index
    @question = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def update
    @question = Question.find(params[:id])

    @question.title = params[:question][:title]
    @question.body  = params[:question][:body]
    @question.resolved = params[:question][:resolved]

    if @question.save
      flash[:notice] = "Your Question is updated"
      redirect_to @question
    else
      flash[:notice] = "Something went wrong, Please try again"
      render :show
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
   @question = Question.find(params[:id])
   if @question.destroy
     flash[:notice] = "\"#{@question.title}\" was deleted successfully."
     redirect_to question_path
   else
     flash[:error] = "There was an error deleting the post."
     render :show
   end
 end
end
