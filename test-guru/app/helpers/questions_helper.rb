module QuestionsHelper

  def question_header(question)
    if question.new_record?
      "Create New question for test: #{question.test.title}"
    else
      "Edit question. Test: #{question.test.title} <h1>"
    end
  end
end
