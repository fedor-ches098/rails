class Test < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id


  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  def self.sort_by_category(category_name)
    joins(:category).where("categories.title = ?", category_name).order(title: :desc).pluck(:title)
  end
end
