class TestPassagesController < ApplicationController
  
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result 
  end

  def update
    @test_passage.accept!(params[:answer_ids]) unless @test_passage.time_is_up?
  
    if @test_passage.completed? || @test_passage.time_is_up?
      BadgeService.new(@test_passage).reward! if @test_passage.passed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage) 
    else 
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
