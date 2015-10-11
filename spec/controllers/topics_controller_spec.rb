require 'rails_helper'
include RandomData
# include SessionHelper

  RSpec.describe TopicsController, type: :controller do
   let(:my_topic) { create(:topic) }
   let (:my_private_topic) { create(:topic, public: false) }

   context "guest" do
    describe "GET index" do

    it "does not include private topics in @topics" do
      get :index
      expect(assigns(:topics)).not_to include(my_private_topic)
    end

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns my_topic to topic" do
        get :index
        expect(assigns(:topic)).to eq([my_topic, my_private_topic])
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, {id: my_topic.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, {id: my_topic.id}
        expect(response).to render_template :show
      end

      it "assigns my_topic to topic" do
        get :show, {id: my_topic.id}
        expect(assigns(:topic)).to eq(my_topic)
      end
    end

     describe "GET new" do
      it "returns http redirect" do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "POST create" do
      it "returns http redirect" do
        post :create, topic: {name: RandomData.random_sentence, description: RandomData.random_paragraph}
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET edit" do
      it "returns http redirect" do
        get :edit, {id: my_topic.id}
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        new_name = RandomData.random_sentence
        new_description = RandomData.random_paragraph

        put :update, id: my_topic.id, topic: {name: new_name, description: new_description }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, {id: my_topic.id}
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  context "member user" do
    before do
      user = User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld", role: :member)

    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns my_topic to topic" do
        get :index
        expect(assigns(:topic)).to eq([my_topic, my_private_topic])
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, {id: my_topic.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, {id: my_topic.id}
        expect(response).to render_template :show
      end

      it "assigns my_topic to topic" do
        get :show, {id: my_topic.id}
        expect(assigns(:topic)).to eq(my_topic)
      end
    end

    describe "GET new" do
      it "returns http redirect" do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "POST create" do
      it "returns http redirect" do
        post :create, topic: {name: RandomData.random_sentence, description: RandomData.random_paragraph}
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET edit" do
      it "returns http redirect" do
        get :edit, {id: my_topic.id}
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        new_name = RandomData.random_sentence
        new_description = RandomData.random_paragraph

        put :update, id: my_topic.id, topic: {name: new_name, description: new_description}
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, {id: my_topic.id}
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  context "admin user" do
      before do
        user = User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld", role: :admin)
      end

      describe "GET index" do
        it "returns http success" do
          get :index
          expect(response).to have_http_status(:success)
        end

        it "assigns my_topic to topic" do
          get :index
          expect(assigns(:topic)).to eq([my_topic, my_private_topic])
        end
      end

      describe "GET show" do
        it "returns http success" do
          get :show, {id: my_topic.id}
          expect(response).to have_http_status(:success)
        end

        it "renders the #show view" do
          get :show, {id: my_topic.id}
          expect(response).to render_template :show
        end

        it "assigns my_topic to topic" do
          get :show, {id: my_topic.id}
          expect(assigns(:topic)).to eq(my_topic)
        end
      end

      describe "GET new" do
        it "returns http redirect" do
          get :new
          expect(response).to redirect_to(new_session_path)
        end
      end

      describe "POST create" do
        it "returns http redirect" do
          post :create, topic: {name: RandomData.random_sentence, description: RandomData.random_paragraph}
          expect(response).to redirect_to(new_session_path)
        end
      end

      describe "GET edit" do
        it "returns http redirect" do
          get :edit, {id: my_topic.id}
          expect(response).to redirect_to(new_session_path)
        end
      end

      describe "PUT update" do
        it "returns http redirect" do
          new_name = RandomData.random_sentence
          new_description = RandomData.random_paragraph

          put :update, id: my_topic.id, topic: {name: new_name, description: new_description}
          expect(response).to redirect_to(new_session_path)
        end
      end

      describe "DELETE destroy" do
        it "returns http redirect" do
          delete :destroy, {id: my_topic.id}
          expect(response).to redirect_to(new_session_path)
        end

        it "redirects to topics index" do
          delete :destroy, {id: my_topic.id}
          expect(response).to redirect_to new_session_path
        end
      end
    end
end
