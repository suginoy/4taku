class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    # @questions = Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @user = current_user
    @question = Question.find(params[:id])
    @next_question = Question.other_question(params[:id])
    @summary = @user.prepare_summary(@question[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :ok }
    end
  end

  # POST /questions/1/answer
  # POST /questions/1/answer.json
  def answer
    @question = Question.find(params[:id])
    @user = current_user
    @summary = @user.prepare_summary(@question[:id])
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

  # GET /questions/1
  # GET /questions/1.json
  def first 
    @question = Question.first

    redirect_to :action => "show", :id => @question[:id]
  end
end
