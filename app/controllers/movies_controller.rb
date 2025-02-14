class MoviesController < ApplicationController
  
  def index 
    @movies = Movie.all
    movies = Movie.all.as_json(only: [:id, :title, :release_date])
    render json: movies, status: :ok 
  end 
  
  def show 
    movie = Movie.find_by(id: params[:id])
    
    if movie
      render json: movie.as_json(only: [:id, :title, :overview, :release_date, :inventory, :available_inventory])
      return
    else 
      not_found
    end 
  end 
  
  def create
    movie = Movie.new(movie_params)
    
    if movie.save
      render json: movie.as_json(only: [:id]), status: :ok
      return
    else 
      bad_request(movie)
    end 
  end 
  
  private 
  
  def movie_params
    params.permit(:title, :overview, :release_date, :inventory, :available_inventory)
  end 
end
