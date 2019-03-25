class CompletedTestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!

  def show
    @test = Test.find(params["id"])
    @questions = Question.where({ test_id: @test.id }).order(created_at: :asc)
  end

  def result
    @params = params
    @answers = []

    @params.each do |key, value|
      if key.include? "Question"
        @answers.push(value)
      end
    end

    @test = Test.find(params["id"])
    @questions = Question.where({ test_id: @test.id }).order(created_at: :asc)
  end
end
