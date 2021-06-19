class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :vote_movie, :unvote_movie]

  def index
    @movies = Movie.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @user = current_user
    if @user.present?
      @movie = @user.movies.create(movie_params)
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie.update(movie_params)
    redirect_to movies_path
  end

  def destroy
  end

  def vote_movie
    @user = current_user
    if @movie.present? && @user.present?
      @vote = @user.reactions.create(movie_id: @movie.id, reaction_type: params[:type])
      number = @movie.votes.to_i + 1
      update_votes = @movie.update_attribute(:votes, number)
      if @vote && update_votes
        flash[:notice] = "Reaction success"
      else
        flash[:notice] = "Reaction error"
      end
    end
    redirect_to movies_path
  end

  def unvote_movie
    @user = current_user
    if @movie.present? && @user.present?
      @vote = @user.reactions.create(movie_id: @movie.id, reaction_type: params[:type])
      number = @movie.unvotes.to_i + 1
      update_votes = @movie.update_attribute(:unvotes, number)
      if @vote && update_votes
        flash[:notice] = "Reaction success"
      else
        flash[:notice] = "Reaction error"
      end
    end
    redirect_to movies_path
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  protected

  def movie_params
    params.require(:movie).permit(:link, :title, :description)
  end
end
