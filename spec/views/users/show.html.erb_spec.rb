require 'rails_helper'

RSpec.describe 'users/:user_id/posts/show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'William Raga', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Ruby developer from Kenya')
    @second_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.')
    @first_post = Post.create(author: @first_user, title: 'First Post', text: 'This is my first post')
    @second_post = Post.create(author: @first_user, title: 'Second Post', text: 'This is my second post')
    @third_post = Post.create(author: @first_user, title: 'Third post', text: 'This is my third post')
    Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom!')
    Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom!')
    Like.create(post: @first_post, author: @first_user)

    visit user_path(@first_user)
  end
  it 'Show the username:' do
    # visit user_path(@first_user)
    expect(page).to have_content(@first_user.name)
  end

  it 'Shows number of comments' do
    expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
  end

  it 'Shows user profile image' do
    expect(page).to have_css("img[src*='#{@first_user.photo}']")
  end

  it 'Shows user bio' do
    expect(page).to have_content(@first_user.bio)
  end

  it 'Shows first three user posts' do
    @posts = @first_user.posts
    @posts.each do |post|
      expect(page).to have_content(post.text)
    end
  end

  it 'Shows button to view all users posts' do
    expect(page).to have_content('See All Posts')
  end

  it 'Redirects to post show page' do
    click_link @first_post.title
    expect(current_path).to match user_post_path(@first_user, @first_post)
  end

  it 'button redirects to post index' do
    click_link 'See All Posts'
    expect(current_path).to match user_posts_path(@first_user)
  end
end
