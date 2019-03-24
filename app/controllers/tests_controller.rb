class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests/new
  def new
    @test = Test.new
  end

  # POST /tests
  def create
    @test = Test.new(test_params)
    @test.user = User.find(1)
    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tests
  def index
    @tests = Test.all.order(created_at: :desc)
  end

  # GET /tests/1
  def show
    @question = Question.new
    @questions = @test.questions.order(created_at: :desc)
  end

  # DELETE /tests/1
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /tests/1/edit
  def edit
  end

  # PATCH/PUT /tests/1
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: "Test was successfully updated." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_params
    params.require(:test).permit(:name, :description, :level, :points)
  end
end
