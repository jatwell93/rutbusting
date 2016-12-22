class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /things
  # GET /things.json
  def index
    @tasks = Task.rank(:row_order).all
  end

  # GET /things/1
  # GET /things/1.json
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to location_path(@task), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to location_path(@task), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def update_row_order
    @task = Task.find(task_params[:task_id])
    @task.row_order_position = task_params[:row_order_position]
    @task.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:task_id, :title, :user_id, :description, :row_order_position)
    end
end