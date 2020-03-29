class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index
    #@tasks = Task.all
    @tasks = current_user.tasks.order(id: :desc)
    
  end
  
  def show
    #@task = Task.find(params[:id])
    #set_task
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "Taskが正常に投稿されました"
      redirect_to @task
    else
      @tasks = current_user.tasks.order(id: :desc)
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
    if #@task.update(task_params)
       @task.update(id: params[:id])
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
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status,)
  end
end