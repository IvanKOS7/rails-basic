module TestPassagesHelper

  def result_handler(resource)
    resource.test_passed? ? content_tag(:h2, "Good", class: "green") : content_tag(:h2, "Test Failed(", class: "red")
  end

end
