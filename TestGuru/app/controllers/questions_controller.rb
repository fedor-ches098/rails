class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    result = @test.questions.pluck(:id, :body, :test_id)

    render plain: result
  end
  
  def show
    render plain: @question.body
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: "Good"
    else
      render plain: "Bad"
    end
  end

  def destroy
    @question.destroy
    render plain: 'Question deleted'
  end


  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question not found!"
  end
end
