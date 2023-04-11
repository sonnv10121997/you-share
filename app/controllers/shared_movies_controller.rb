class SharedMoviesController < ApplicationController
  before_action :set_shared_movie, only: %i[ show edit update destroy ]

  # GET /shared_movies or /shared_movies.json
  def index
    @shared_movies = SharedMovie.all
    @user = user_signed_in? ? current_user : User.new
  end

  # GET /shared_movies/1 or /shared_movies/1.json
  def show
  end

  # GET /shared_movies/new
  def new
    @shared_movie = SharedMovie.new
  end

  # GET /shared_movies/1/edit
  def edit
  end

  # POST /shared_movies or /shared_movies.json
  def create
    @shared_movie = SharedMovie.new(shared_movie_params)

    respond_to do |format|
      if @shared_movie.save
        format.html { redirect_to shared_movie_url(@shared_movie), notice: "Shared movie was successfully created." }
        format.json { render :show, status: :created, location: @shared_movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shared_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shared_movies/1 or /shared_movies/1.json
  def update
    respond_to do |format|
      if @shared_movie.update(shared_movie_params)
        format.html { redirect_to shared_movie_url(@shared_movie), notice: "Shared movie was successfully updated." }
        format.json { render :show, status: :ok, location: @shared_movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shared_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shared_movies/1 or /shared_movies/1.json
  def destroy
    @shared_movie.destroy

    respond_to do |format|
      format.html { redirect_to shared_movies_url, notice: "Shared movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shared_movie
      @shared_movie = SharedMovie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shared_movie_params
      params.require(:shared_movie).permit(:url, :user_id)
    end
end
