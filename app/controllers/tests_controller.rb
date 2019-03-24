class TestsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:destroy, :edit, :update]

  # GET /tests/new as new_test_path [tests#new]
  def new
    @test = Test.new
  end

  # POST /tests as tests_path [tests#create]
  def create
    @test = Test.new(test_params)
    @test.user = current_user
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

  # GET /tests as tests_path [tests#index]
  def index
    @tests = Test.all.order(created_at: :desc)
  end

  # GET /tests/:id as test_path(id) [tests#show]
  def show
    @question = Question.new
    @questions = @test.questions.order(created_at: :asc)
  end

  # DELETE /tests/:id as test_path(id) [tests#destroy]
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /tests/:id/edit as edit_test_path [tests#edit]
  def edit
  end

  # PATCH /tests/:id as test_path(id) [tests#update]
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

  def authorize_user!
    redirect_to root_path, alert: 'access denied' unless can? :crud, @test
  end

end
