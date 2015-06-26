class MyJob < ActiveJob::Base
  queue_as :default
  include Sidekiq::Worker

  def greeting(string)
    p "do the #{string}" * 100
  end

  def perform(args)
    greeting(args)
  end
end