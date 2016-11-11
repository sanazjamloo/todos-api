class TodosController < ApplicationController

  # POST /todo
  def create
    todo = Todo.new(todo_params)
    puts(todo_params)
    if todo.save
      # render json: todo, status: :created, location: todo
      render json: {status:200, message:"Created"}
    else
      render json: {status:422, todo: todo.errors}
    end
  end

  #GET /todos
  def index
    todos = Todo.all
    render json: {status: 200, todos: todos}
  end

  #GET /todos/1
  def show
    todo = Todo.find(params[:id])
    render json: {status: 200, todo: todo}
  end

  #PATCH/PUT /todos/1
  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: todo
    else
      render json: {status:422, todo: todo.errors}
    end
  end

#DELETE /todo/1
  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    render json: {status: 204, message:"Deleted"}
  end





  private
    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.required(:todo).permit(:description, :done, :created_at, :updated_at)
    end
end
