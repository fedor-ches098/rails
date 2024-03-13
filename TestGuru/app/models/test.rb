class Test < ApplicationRecord
  belongs_to :user
  belongs_to :category


  has_many :test_passes
  has_many :users, through: :test_passes

  def self.sort_by_category(category_name)
    joins(:category).where("categories.title = ?", category_name).order(title: :desc).pluck(:title)
  end
end
