class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  def self.post_categories
    categories = []
    Post.all.map { |i| i.category }.uniq
  end

end
