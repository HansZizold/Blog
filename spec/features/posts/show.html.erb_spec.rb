require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before :each do
    @user = User.create(
      name: 'Gaby',
      photo: 'bulma.jpg',
      bio: 'Systems Engineering Student'
    )
    user2 = User.create(
      name: 'Leo',
      photo: 'vegeta.jpg',
      bio: 'Law Student'
    )
    @post1 = Post.create(author: @user, title: 'Post 1', text: 'Post One')
    post2 = Post.create(author: @user, title: 'Post 2', text: 'Post Two')
    @post3 = Post.create(author: @user, title: 'Post 3', text: 'Post Three')
    post4 = Post.create(author: @user, title: 'Post 4', text: 'Post Four')

    comment1 = Comment.create(author: user1, post: post3, text: 'Hi Tom1')
    comment2 = Comment.create(author: user2, post: post3, text: 'Hi Tom2')
    comment3 = Comment.create(author: user3, post: post3, text: 'Hi Tom3')
    @first_comments = [comment1, comment2, comment3]
    
    visit post_path(post3.id)
  end

  it "shows a post title" do
    title_element = find("h2.name_post")
    expect(title_element).to have_content("#{@post3.title}")
  end

  it "shows the user's username" do
    expect(page).to have_content("#{@post3.author.name}")
  end

  it "shows comments and likes counts" do
    expect(page).to have_content("Comments: #{@post3.comment_counter}, Likes: #{@post3.like_counter}")
  end

  it "shows the post body" do
    title_element = find("h2.name_post")
    expect(title_element).to have_content("#{@post1.text[..200]}")
  end

  it "shows username of post's commentors" do
    authors = Comment.includes(:author).where(:post: @post3.id)
    @authors.each |author| do
      expect(page).to have_content(author.name)
      expect(page).to have_content(author.text)
    end
  end
end
