class QuestionsController < ApplicationController
  # GET /courses/:course_id/questions/1
  # GET /courses/:course_id/questions/1.json
  def show
    @user = current_user
    @question = Question.find(params[:id])
   #@next_question = Question.other_question(params[:id])
    @next_question = @question.next
    @user.prepare_summary(@question[:id])
    @summary = Summary.find_by_user_id_and_question_id(@user[:id], @question[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /courses/:course_id/questions/new
  # GET /courses/:course_id/questions/new.json
  def new
    @question = Question.new(:course_id => params[:course_id])
  end

  # GET /courses/:course_id/questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /courses/:course_id/questions
  # POST /courses/:course_id/questions.json
  def create
    @course = Course.find(params[:course_id])
    @question = @course.questions.build(params[:question])
    @question.save

    respond_to do |format|
      if @question.save
        format.html { redirect_to @course, notice: 'Question was successfully created.' }
        format.json { render json: @course, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/:course_id/questions/1
  # PUT /courses/:course_id/questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question.course, notice: 'Question was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/:course_id/questions/1
  # DELETE /courses/:course_id/questions/1.json
  def destroy
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.destroy
        format.html { redirect_to @question.course, notice: 'Question was successfully deleted.' }
        format.json { head :ok }
      else
        format.html { redirect_to @question.course, notice: 'Question was not deleted.' }
        format.json { render json: @question.errors, status: :unprocessable_destroy }
      end
    end
  end

  # POST /courses/:course_id/questions/1/answer
  # POST /courses/:course_id/questions/1/answer.json
  def answer
    # TODO: サマリ更新ロジックをモデルに移動
    @question = Question.find(params[:id])
    @user = current_user
    @summary = Summary.find_by_user_id_and_question_id(@user[:id], @question[:id])
    @score = @user.scores.build(:question => @question, :summary_id => @summary[:id], :user_answer => params[:answer].to_i, :answer_date => Time.current)

    if @question.answer == @score[:user_answer]
      @correct = true
      @score.correct = true
      @summary.attributes = { :total => @summary[:total] + 1, :right => @summary[:right] + 1 }
    else
      @correct = false
      @score.correct = false
      @summary.attributes = { :total => @summary[:total] + 1 }
    end 
    @summary.save!
    @score.save!
  end
end
