class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> {where(correct: true)}

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  def validate_max_answers
    message = "max 4 answers!"
    errors.add(:question, message) if question.answers.count > 4
  end
end
