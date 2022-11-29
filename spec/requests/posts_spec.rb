require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  it 'returns http success' do
    get '/users/1/posts/'
    expect(response).to have_http_status(:success)
  end

  it 'to have template index for all posts' do
    get '/users/1/posts'
    expect(response).to render_template(:index)
  end

  it 'Body incudes correct placeholder text: Posts' do
    get '/users/1/posts/'
    expect(response.body).to include("Posts")
  end
end