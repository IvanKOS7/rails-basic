class TestPassagesController < ApplicationController
#show porm test_passage
   before_action :set_test_passage, only: [:show, :update, :result, :gist]

   def show
   end

   def result
   end

   def update
     if @test_passage.answer_choosed?(params[:answer_ids])
       @test_passage.accept!(params[:answer_ids])
     else
       flash.now[:alert] = t('.failure')
     end

     if @test_passage.completed?

       if @test_passage.test_passed?
          @test_passage.update(test_passed: true)
          BadgesService.new(@test_passage)
        else
          @test_passage.update(test_passed: false)
        end

       TestsMailer.completed_test(@test_passage).deliver_now
       redirect_to result_test_passage_path(@test_passage)
     else
       render :show
     end
   end

   def gist
     result = GistQuestionService.new(@test_passage.current_question)
     #GistQuestionService method call
     result.call

     flash_options = if result.success?
       gist = current_user.gists.new(url: result.client.last_response.data.html_url, question_id: @test_passage.current_question.id).save
       { notice: "#{t('.success')} #{view_context.link_to 'Gist', result.client.last_response.data.html_url}"}
     else
        { alert: "#{t('.failure')}"}
     end

     redirect_to @test_passage, flash_options
   end

   private

   def set_test_passage
     @test_passage = TestPassage.find(params[:id])
   end

end
