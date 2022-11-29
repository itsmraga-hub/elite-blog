require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'returns http success' do
    get '/users/'
    expect(response).to have_http_status(:success)
  end

  it 'to have template index for all users' do
    get '/users/'
    expect(response).to render_template(:index)
  end

  it 'Body incudes correct placeholder text: Users' do
    get '/users/'
    expect(response.body).to include("Users")
  end
end
