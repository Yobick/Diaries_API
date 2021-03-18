require 'sidekiq'
require 'sidekiq/web'

Rails.application.routes.draw do

  namespace 'api' do
      resources :diaries, :notes
  end

  mount Sidekiq::Web => "/sidekiq"

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'admin' && password == 'admin'
  end
end
