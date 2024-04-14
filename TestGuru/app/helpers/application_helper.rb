module ApplicationHelper
  def flash_message(type, msg)
    content_tag :p, msg, class: "flash #{type}"
  end
  
  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    link_to("TestGuru", "https://github.com/#{author}/#{repo}", target: "_blank")
  end
end
