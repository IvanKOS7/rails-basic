module ApplicationHelper

  FLASH_HELPER = { :alert => "Please, check fields " }.freeze

  def current_year
    year = Time.new.year
  end
#IvanKOS7
#ruby-basics
  def github_url(author, repo)
    link_to 'GITHUB', "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def flash_helper(level)
    case level
        when "notice" then "alert alert-primary"
        when "success" then "alert alert-success"
        when "error" then "alert alert-error"
        when "alert" then "alert alert-danger"
    end
end
end
