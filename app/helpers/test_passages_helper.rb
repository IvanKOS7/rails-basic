module TestPassagesHelper

  def good_result
    content_tag(:h2, "Good", class: "red")
  end

  def bad_result
    content_tag(:h2, "Test Failed(", class: "red")
  end

end
