require 'rails_helper'
require 'sidekiq/testing'

Sidekiq::Testing.fake!

RSpec.describe "Diaries", type: :request do
  it 'GET index' do
    FactoryBot.create(:diary, title: 'test1',  expiration: DateTime.now + 2.day, kind: rand(0..1))
    FactoryBot.create(:diary, title: 'test2',  expiration: DateTime.now + 10.minute, kind: rand(0..1))

    get '/api/diaries'

    expect(response).to have_http_status(200)
    expect(response).to render_template :index
  end
end
