module ApplicationHelper

  FLASH_HELPER = { "alert" => "alert-danger",
                   "notice" => "alert-success",
                  #добавить еще флешей
                                             }.freeze

  def current_year
    year = Time.new.year
  end

  def current_time
    current_time = Time.now
  end
#IvanKOS7
#ruby-basics
  def github_url(author, repo)
    link_to 'GITHUB', "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def flash_helper(level)
    FLASH_HELPER[level]
  end
end
