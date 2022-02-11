module TestPassagesHelper
  def percent
      @percent = @test_passage.correct_questions.fdiv(@right_answers.count) * 100
  end

  def result_handler
    percent
    if @percent >= 85
      content_tag(:div, content_tag(:h2, "#{@percent}%-Good"), class: "green")
    else
      content_tag(:div, content_tag(:h2, "#{@percent}%-Test Failed("), class: "red")
    end
  end
end
