class AddArticleIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :, :article_id
    add_column :comments, :, :integer
  end
end
