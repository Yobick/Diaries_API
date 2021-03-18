class DelWorker
  include Sidekiq::Worker

  def perform
       Diary.where("expiration < ?", DateTime.now).destroy_all
  end
end
