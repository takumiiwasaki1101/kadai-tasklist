class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end
  
  def show
    #@task = Task.find(params[:id])
    #set_task
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "Taskが正常に投稿されました"
      redirect_to @task
    else
      flash.now[:danger] = "Taskが正常に投稿されませんでした"
      render :new
    end
  end
  
  def edit
    #@task = Task.find(params[:id])
    #set_task
  end
  
  def update
    #@task = Task.find(params[:id])
    #set_task
    if @task.update(task_params)
      flash[:success] = "Taskは正常に更新されました"
      redirect_to @task
    else
      flash.now[:danger] = "Taskは更新されませんでした"
      render :edit
    end
  end
  
  def destroy
    #@task = Task.find(params[:id])
    #set_task
    @task.destroy
    
    flash[:success] = "Messageは正常に削除されました"
    redirect_to tasks_url
  end

  private
  
  def set_task
    @task = Task.find(params[:id])
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
end