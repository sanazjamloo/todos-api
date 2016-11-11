class TodosController < ApplicationController

  def index
    render json: {status: 200, message: "Hello there!"}
  end
end
