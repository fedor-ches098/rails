require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  VALID_EMAIL = /\A\w+@\w+\.\w+\z/

  validates :name, :role, presence: true
  validates :email, presence: true,
                    format: VALID_EMAIL,
                    uniqueness: { case_sensitive: false }

  has_secure_password

  def tests_by_level(level)
    tests.where("level = ?", level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
