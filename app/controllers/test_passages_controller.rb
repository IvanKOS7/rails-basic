class TestPassagesController < ApplicationController
#show porm test_passage
before_action :set_test_passage, only: [:show, :update, :result]
   before_action :test_right_answers_count, only: :result

   def show
   end

   def result
   end

   def update
     @test_passage.accept!(params[:answer_ids])
     if @test_passage.completed?
       redirect_to result_test_passage_path(@test_passage)
     else
       render :show
     end
   end

   private

   def set_test_passage
     @test_passage = TestPassage.find(params[:id])
   end

   def test_right_answers_count
     @right_answers = @test_passage.test.questions.map
   end
   
end
