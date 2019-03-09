class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    puts 'Hello'
    logger.debug 'info'
  end
end
