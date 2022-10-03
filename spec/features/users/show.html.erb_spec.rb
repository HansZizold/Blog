require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  before :each do
    user1 = User.create(
      name: 'Gaby',
      photo: 'bulma.jpg',
      bio: 'Systems Engineering Student'
    )
    user2 = User.create(
      name: 'Leo',
      photo: 'vegeta.jpg',
      bio: 'Law Student'
    )
    @users = [user1, user2]
    visit users_path
  end

  it 'shows the right content' do
    @users.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_css("img[src*='#{user.photo}']")
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end
  end

  it 'changes to user profile after clicking on a user name' do
    click_link(@users.first.name)
    expect(page).to have_content('Systems Engineering Student')
  end
end
