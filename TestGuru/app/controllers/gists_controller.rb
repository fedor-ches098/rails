class GistsController < ApplicationController
  before_action :find_test_passage, only: %i[create]

  def create
    response = GistQuestionService.new(@test_passage.current_question)
    result = response.call

    flash_options = if response.success?
      current_user.gists.create(question: @test_passage.current_question, url: result.html_url)
      { notice: t('.success', url: "#{view_context.link_to 'Gist', result.html_url}")}
    else
      { alert: t('.failure')}
    end

    redirect_to @test_passage, flash_options
  end

  private 

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end