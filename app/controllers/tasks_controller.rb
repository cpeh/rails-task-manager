class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.save
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(tasks_params)
      redirect_to @task, notice: "This would be a popup"
    else
      render :edit, notice: "Change <something></something>"
    end
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
