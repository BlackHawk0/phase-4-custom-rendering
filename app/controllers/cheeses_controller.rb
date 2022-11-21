class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # render json: cheeses, excpet: [:created_at, :updated_at]
    render json: cheeses, only: [:id, :name, :price, :is_best_seller]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, only: [:id, :name, :price, :is_best_seller],
      methods: [:summary]
    else
      # status: :not_found will produce a 404 status code
      render json: {error: 'Cheese not found'}, status: :not_found
    end
  end

end
