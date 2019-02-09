class TopMoviesController < ApplicationController
  before_action :set_top_movie, only: [:show, :edit, :update, :destroy]

  # GET /top_movies
  # GET /top_movies.json
  def index
    @top_movies = TopMovie.all
  end

  # GET /top_movies/1
  # GET /top_movies/1.json
  def show
  end

  # GET /top_movies/new
  def new
    @top_movie = TopMovie.new
  end

  # GET /top_movies/1/edit
  def edit
  end

  # POST /top_movies
  # POST /top_movies.json
  def create
    @top_movie = TopMovie.new(top_movie_params)

    respond_to do |format|
      if @top_movie.save
        format.html { redirect_to @top_movie, notice: 'Top movie was successfully created.' }
        format.json { render :show, status: :created, location: @top_movie }
      else
        format.html { render :new }
        format.json { render json: @top_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /top_movies/1
  # PATCH/PUT /top_movies/1.json
  def update
    respond_to do |format|
      if @top_movie.update(top_movie_params)
        format.html { redirect_to @top_movie, notice: 'Top movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @top_movie }
      else
        format.html { render :edit }
        format.json { render json: @top_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /top_movies/1
  # DELETE /top_movies/1.json
  def destroy
    @top_movie.destroy
    respond_to do |format|
      format.html { redirect_to top_movies_url, notice: 'Top movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top_movie
      @top_movie = TopMovie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def top_movie_params
      params.fetch(:top_movie, {})
    end
end
