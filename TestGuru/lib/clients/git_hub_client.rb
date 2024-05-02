class GitHubClient  
  def initialize
    @client = setup_http_client
  end

  def create_gist(params)
    @client.create_gist(params)
  end

  def get_status
    @client.last_response.status
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end
end