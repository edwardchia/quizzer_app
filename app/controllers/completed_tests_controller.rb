class CompletedTestsController < ApplicationController
  def show
    @test = Test.find(params["id"])
    @questions = Question.where({ test_id: @test.id })
    puts @questions
  end
end
