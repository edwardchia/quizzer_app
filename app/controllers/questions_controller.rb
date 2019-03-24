class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy]

  # POST /questions
  def create
    # render json: question_params
    @test = Test.find params[:test_id]

    @question = Question.new()
    @question.solution_id = question_params["correct"]
    @question.description = question_params["description"]
    @question.test = @test
    respond_to do |format|
      if @question.save
        @question_id = Question.last.id

        @answer = Answer.new()
        @answer.question_id = @question_id
        @answer.content = question_params["a"]
        @answer.save

        @answer = Answer.new()
        @answer.question_id = @question_id
        @answer.content = question_params["b"]
        @answer.save

        @answer = Answer.new()
        @answer.question_id = @question_id
        @answer.content = question_params["c"]
        @answer.save

        @answer = Answer.new()
        @answer.question_id = @question_id
        @answer.content = question_params["d"]
        @answer.save
        format.html { redirect_to test_url(@test), notice: "Question was successfully created." }
      else
        @questions = @test.questions.order(created_at: :asc)
        format.html { render "tests/show" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to test_url(@question.test), notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /questions/1/edit
  def edit
    # render json: set_question
  end

  # PATCH/PUT /questions/1
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:description, :a, :b, :c, :d, :correct)
  end
end
