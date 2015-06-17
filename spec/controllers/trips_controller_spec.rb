require 'rails_helper'
require 'factory_girl_rails'
require 'faker'

RSpec.describe TripsController, :type => :controller do
  before(:each) do
    User.destroy_all
    Trip.destroy_all
    user = User.create(email: Faker::Internet.email)
    user.password = Faker::Internet.password
    user.save
    session[:user_id] = user.id
    @trip = Trip.create(
      origin_city: Faker::Address.city,
      origin_country: Faker::Address.country,
      destination_city: Faker::Address.city,
      destination_country: Faker::Address.country,
      timespan: %w(1 2 3 4 5 6 7).sample,
    duration: %w(days weeks months years).sample)
    @user = controller.send(:current_user)
  end

  describe "GET index" do
    it "returns http success" do
      get :index, id: @trip.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do

      get :show, id: @trip.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, id: @trip.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    context 'with valid attributes' do
      it 'saves the new trip in the database' do
        expect{
          post :create, id: @trip.id, trip: {
            origin_city: Faker::Address.city,
            origin_country: Faker::Address.country,
            destination_city: Faker::Address.city,
            destination_country: Faker::Address.country,
            timespan: %w(1 2 3 4 5 6 7).sample,
            duration: %w(days weeks months years).sample
          }
        }.to change(Trip, :count).by(1)
        # this workaround below seems incredibly janky to me
        trip = Trip.last
        expect(response).to redirect_to(trip_path(trip))
      end
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, id: @trip.id
      expect(response).to have_http_status(:success)
      expect(response).to render_template :edit
    end
  end

  describe "PUT update" do
    it "returns http success" do
        put :update, id: @trip.id, trip: {
        origin_city: Faker::Address.city,
        origin_country: Faker::Address.country,
        destination_city: Faker::Address.city,
        destination_country: Faker::Address.country,
        timespan: %w(1 2 3 4 5 6 7).sample,
        duration: %w(days weeks months years).sample
      }, id: @trip.id
      #http://stackoverflow.com/questions/9223336/how-to-write-an-rspec-test-for-a-simple-put-update
      #http://stackoverflow.com/questions/21802442/rspec-controller-testing-expected-response-to-be-a-redirect-but-was-200
      expect(response).to redirect_to(trip_path(@trip))
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy, id: @trip.id
      expect(response).to redirect_to trips_path
    end
  end

end
