module QuestionsHelper

  def question_header(action)
    render inline: "<h1>#{action.to_s.capitalize!} New <%= @test.title %> Question <h1>"
  end
end
