class CompletedTestsController < ApplicationController
  def show
    @test = Test.find(params["id"])
  end
end
