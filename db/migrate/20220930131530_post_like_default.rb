class PostLikeDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :like_counter, 0
  end
end
