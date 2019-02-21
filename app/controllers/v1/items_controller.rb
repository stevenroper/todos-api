class V1::ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, only: [:show, :update, :destroy]
  
  # GET /todos/:todo_id/items
  def index
    json_response(@todo.items)
  end

  # GET /todos/:todo_id/items/:id
  def show
    json_response(@item)
  end

  # POST /todos/:todo_id/items
  def create
    @item = @todo.items.create!(item_params)
    json_response(@item, :created)
  end

  # PUT /todos/:todo_id/items/:id
  def update
    @item.update(item_params)
    json_response(@item, :accepted)
  end

  # DELETE /todos/:todo_id/items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private
  
  def item_params
    params.permit(:name, :done)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
    raise(ExceptionHandler::NotFound) if @todo.created_by != current_user.id.to_s
  end

  def set_todo_item
    @item = @todo.items.find_by!(id: params[:id]) if @todo
  end
end