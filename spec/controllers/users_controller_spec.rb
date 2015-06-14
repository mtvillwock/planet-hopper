require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe UsersController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET show" do
    let(:user) do
      # User.all.destroy_all
      user = User.create(email: Faker::Internet.email)
      user.password = Faker::Internet.password
      user.save
      user
    end
    let(:id) { session[:user_id] = user.id }
    let(:user_id) { controller.send(:current_user).id }
    xit "returns http success" do
      get :show, id: user_id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context 'with valid attributes' do
      it 'saves the new user in the database' do
        user = User.new(email: Faker::Internet.email)
        expect{
          post '/users', user
        }.to change(User, :count).by(1)
      end
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
