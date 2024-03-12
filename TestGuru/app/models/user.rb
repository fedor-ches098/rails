class User < ApplicationRecord
  has_many :tests

  def tests_by_level(level)
    tests.joins(:user).where("users.id = ? AND level = ?", self.id, level)
  end
end
