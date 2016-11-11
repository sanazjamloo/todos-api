class TodosController < ApplicationController

  #POST /todo
  def create
    todo = Todo.new(todo_params)
    puts(todo_params)
  end
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
























  private
    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.required(:todo).permit(:description, :done, :created_at, :updated_at)
    end
