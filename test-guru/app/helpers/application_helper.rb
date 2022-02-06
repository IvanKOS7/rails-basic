module ApplicationHelper
  
  def current_year
    year = Time.new.year
  end
#IvanKOS7
#ruby-basics
  def github_url(author, repo)
    link_to 'GITHUB', "https://github.com/#{author}/#{repo}", target: "_blank"
  end
end
