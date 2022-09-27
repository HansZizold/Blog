require 'rails_helper'

RSpec.describe PostsController, type: :request do
  it 'Expect a response code 200 and render correctly from the view index' do
    get '/users/1/posts'
    expect(response).to render_template(:index)
    expect(response.status).to eq(200)
    expect(response.body).to include('User Number One')
  end

  it 'Expect a response code 200 and render correctly from the view show' do
    get '/users/1/posts/1'
    expect(response).to render_template(:show)
    expect(response.status).to eq(200)
    expect(response.body).to include('by Username')
  end
end
