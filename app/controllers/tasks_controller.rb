# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy move]

  # GET /projects/1/tasks
  # GET /projects/1/tasks.json
  def index
    @tasks = task.all
  end

  # GET /projects/1/tasks/1
  # GET /projects/1/tasks/1.json
  def show; end

  # GET /projects/1/tasks/new
  def new
    @task = task.new
  end

  # GET /projects/1/tasks/1/edit
  def edit; end

  # POST /projects/1/tasks
  # POST /projects/1/tasks.json
  def create
    @task = task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1/tasks/1
  # PATCH/PUT /projects/1/tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1/tasks/1
  # DELETE /projects/1/tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH /projects/1/tasks/1/move
  def move
    @task.insert_at(params[:position].to_i)
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:description, :position)
  end
end
