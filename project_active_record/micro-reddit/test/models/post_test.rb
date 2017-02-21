require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = User.new(id: 1)
    @post = Post.new(title: "Reddit", link: "https://www.reddit.com",
                     user_id: 1)
  end

  test "should be valid" do
    assert @post.valid?, @post.errors.full_messages
  end

  test "title should be present" do
    @post.title = " "
    assert_not @post.valid?
  end
  
#  test "title should not be too long" do
#    @post.title = "a" * 256
#    assert_not @post.valid?
#  end
  
  test "link should be present" do
    @post.link = " "
    assert_not @post.valid?
  end
  
  test "link validation should accept valid links" do
    valid_links = %w[www.google.com https://www.google.com google.co.jp drive.google.com google.com/hi/what_is/this%20doing/here.jpg]
    valid_links.each do |valid_link|
      @post.link = valid_link
      assert @post.valid?, "#{valid_link.inspect} should be valid"
    end
  end
  
  test "link validation should reject invalid links" do
  end
  
  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

end
