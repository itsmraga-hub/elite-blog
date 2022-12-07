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

    visit user_post_path(@first_user, @first_post)
  end
  it 'Show the post author' do
    expect(page).to have_content(@first_post.author.name)
  end

  it 'Shows the posts title' do
    expect(page).to have_content(@first_post.title)
  end

  it 'Shows number of comments of the post' do
    expect(page).to have_content("Comments: #{@first_post.comments_counter}")
  end

  it 'Shows number of likes of the post' do
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end

  it 'Shows post body' do
    expect(page).to have_content(@first_post.text)
  end

  it 'shows the comments on a post' do
    @first_post.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'shows the comments on a post' do
    @first_post.comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end
end
