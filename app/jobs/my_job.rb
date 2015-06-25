class MyJob < ActiveJob::Base
  queue_as :default
  include Sidekiq::Worker

  def something
    p "do the thing"
  end

  def perform(args)
  end
end