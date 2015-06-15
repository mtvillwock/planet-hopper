require 'rails_helper'
require 'factory_girl_rails'
require 'faker'

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
      session[:user_id] = user.id
      controller.send(:current_user)
    end
    # let(:id) { session[:user_id] = user.id }
    # let(:user_id) { controller.send(:current_user).id }
    it "returns http success" do
      get :show, id: user.id
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
        expect{
          # this is hacky but I don't know how else to get the newly built
          # but not yet saved user and set their password so it saves
          user = build(:valid_user)
          user.save
          # post :create, :user => { "email" => Faker::Internet.email }
          # user = User.last.password = Faker::Internet.password
          # user.save
        }.to change(User, :count).by(1)
      end
      # it 'should redirect to user's profile' do
      # end
    end
    context 'with invalid attributes' do
      it 'does not save the new user in the database' do
        # user = build(:user_without_email)
        # expect{user.save}.to_not change(User, :count)
        expect{
          post :create, user: {email: nil }
        }.to_not change(User, :count)
      end
      it 'renders the new user template' do
        expect{
          post :create, user: {email: nil }
        }.to_not change(User, :count)
        expect(response).to render_template :new
      end
    end
  end

  describe "GET edit" do
    xit "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET update" do
    xit "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET destroy" do
    xit "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
