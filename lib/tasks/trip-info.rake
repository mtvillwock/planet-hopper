# desc "Collect info for users after they create a trip"
# task :collect_trip_info => :environment do
#   puts "Collecting trip info"
#   TripInfoWorker.new.perform
#   puts "done."
# end