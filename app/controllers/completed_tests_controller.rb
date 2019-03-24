class CompletedTestsController < ApplicationController
  before_action :authenticate_user!
  def show
    @test = Test.find(params["id"])
  end
end
