class TripInfoWorker
  include Sidekiq::Worker

  def perform(trip_id)
    trip = Trip.find(trip_id)
    p "The trip is "
    p trip
    # do all the tasks required to compile trip info
  end
end