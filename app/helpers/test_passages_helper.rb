module TestPassagesHelper

  def result_handler(resource)
    resource.test_passed? ? content_tag(:h2, "Good", class: "text-success") : content_tag(:h2, "Test Failed(", class: "text-danger")
  end

end
