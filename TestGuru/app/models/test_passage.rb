class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: [:create, :update]

  SUCCESS_SCORE = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def success_rate
    (correct_questions.to_f / test.questions.count.to_f) * 100
  end

  def success?
    success_rate >= SUCCESS_SCORE
  end

  def current_question_index
    test.questions.ids.find_index(current_question.id) + 1
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end
  
  def correct_answers
    current_question.answers.correct
  end
  
  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_current_question
    if current_question.nil?
      self.current_question = test.questions.first
    else
      self.current_question = next_question
    end
  end
end
