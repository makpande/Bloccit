require 'rails_helper'
include RandomData

RSpec.describe QuestionsController, type: :controller do

  # let (:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  let (:question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: question.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "increases the number of Question by 1" do
      expect{post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Question,:count).by(1)
    end

    it "assigns the new post to @post" do
      post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:question)).to eq Question.last
    end

      it "redirects to the new post" do
      post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to Question.last
    end
  end

end
