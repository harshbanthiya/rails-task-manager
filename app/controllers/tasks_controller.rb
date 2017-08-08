class TasksController < ApplicationController
  def index
    @tasks = Task.all 
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def create
    @task = Task.create(user_params)
    redirect_to tasks_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(user_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path(@task)
  end

  private 
    def user_params
      params.require(:tasks).permit(:title)
    end
end