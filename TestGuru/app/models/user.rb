class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  def tests_by_level(level)
    tests.where("level = ?", level)
  end
end
