class PostCommentDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :comment_counter, 0
  end
end
