class TestPassagesController < ApplicationController
#show porm test_passage
   before_action :set_test_passage, only: [:show, :update, :result, :gist]

   def show
   end

   def result
   end

   def update
     @test_passage.accept!(params[:answer_ids])
     if @test_passage.completed?
       TestsMailer.completed_test(@test_passage).deliver_now
       redirect_to result_test_passage_path(@test_passage)
     else
       render :show
     end
   end

   def gist
     result = GistQuestionService.new(@test_passage.current_question).call


     flash_options = if result.exception
        { alert: "#{t('.failure')}: #{result.message}"}
      else
          gist = current_user.gists.new(url: result.html_url, question_id: @test_passage.current_question.id).save
        { notice: "#{t('.success')} #{view_context.link_to 'Gist', result.html_url}"}
      end

     redirect_to @test_passage, flash_options
   end

   private

   def set_test_passage
     @test_passage = TestPassage.find(params[:id])
   end
end
