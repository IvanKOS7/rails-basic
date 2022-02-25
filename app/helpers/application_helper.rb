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

  def flash_helper(key)
    flash.now[key] = FLASH_HELPER[key]
  end
end
