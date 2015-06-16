class TripInfoWorker
  include Sidekiq::Worker

  def perform(trip_attributes)
    trip_attributes = JSON.load(trip_attributes)
    puts "trip_attributes are: #{trip_attributes}"
    # do all the tasks required to compile trip info
  end
end