class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  def self.post_categories
    categories = []
    Post.all.map { |i| i.category }.uniq
  end

end
