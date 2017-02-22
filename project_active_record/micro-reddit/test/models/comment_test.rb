require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = Comment.new(body: "This is a comment", user_id: 1, post_id: 1)
  end

  test "should be valid" do
    assert @comment.valid?
  end

end
