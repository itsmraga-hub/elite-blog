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
    @first_coment = Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom!')
    @second_comment = Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom!')
    Like.create(post: @first_post, author: @first_user)

    visit user_posts_path(@first_user)
  end

  it 'Show the username:' do
    # visit user_path(@first_user)
    expect(page).to have_content(@first_user.name)
  end

  it 'Shows number of posts' do
    expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
  end

  it 'Shows user profile image' do
    expect(page).to have_css("img[src*='#{@first_user.photo}']")
  end

  it 'Shows Number of posts by user' do
    expect(page).to have_content('Number of posts: 3')
  end

  it 'Shows number of comments on a post' do
    expect(page).to have_content("Comments: #{@first_post.comments_counter}")
  end

  it 'Shows number of likes on a post' do
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end

  it 'Shows post title' do
    expect(page).to have_content(@first_post.title)
  end

  it 'Shows part of post body' do
    expect(page).to have_content(@first_post.text)
  end

  it 'shows the comments on a post' do
    @first_post.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'to show the Pagination buttons' do
    expect(page).to have_content('1')
    expect(page).to have_content('Next')
  end

  # it 'Shows first three user posts' do
  #   @posts = @first_user.posts
  #   @posts.each do |post|
  #     expect(page).to have_content(post.text)
  #   end
  # end

  it 'Redirects to post show page' do
    click_link @first_post.title
    expect(current_path).to match user_post_path(@first_user, @first_post)
  end

  # it 'button redirects to post index' do
  #   click_link 'See All Posts'
  #   expect(current_path).to match user_posts_path(@first_user)
  # end
end
