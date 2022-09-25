require 'rails_helper'

RSpec.describe 'Appointments API', type: :request do
  # let!(:user) { create(:user) }
  let!(:user) do
    FactoryBot.create(:user, name: 'Alex Toledo', username: 'Alext',
                             email: 'alex@email.com', password: 'foobar', password_confirmation: 'foobar')
  end
  let!(:restaurant) { create(:restaurant) }
  let!(:a) { { date: Date.today, duration: '1 hr', status: 'booked', user_id: user, restaurant_id: restaurant } }
  let!(:login_params) { { username: 'Alext', password: 'foobar' } }
  before { post '/api/v1/appointments', params: a }

  describe 'GET /appointments' do
    # before { get '/api/v1/appointments', headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }
    it 'returns nil appointments because no token' do
      expect(json).not_to be_empty
      expect(response['duration']).to eq(nil)
      expect(response).to have_http_status(401)
    end
  end
end
