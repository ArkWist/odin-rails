require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = Comment.new(body: "This is a comment", user_id: 1, post_id: 1)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "body should be present" do
    @comment.body = " "
    assert_not @comment.valid?
  end
  
  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "post id should be present" do
    @comment.post_id = nil
    assert_not @post.valid?
  end

end
