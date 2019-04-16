class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def create
    @movie = Movie.new(movie_params)
    
    if @movie.save
      flash[:notice] = "Movie was succesfully saved"
      redirect_to @movie
    else
      render 'new'
    end
  end
  
  def new
    @movie = Movie.new
  end
  
  def show
    @movie = Movie.find(params[:id])
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update  
    @movie = Movie.find(params[:id])
    
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
 
    redirect_to movies_path
  end
  
  private

  def movie_params
    params.permit(:title, :description, :rating)
  end
  
end
