class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.get_status
  end

  private

  def gist_params
    {
      description: I18n.t('gists.description', test_title: @test.title),
      files: {
        "test-guru-question.txt" => {
          content: gist_content
        }
      }
    }    
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
