class Api::ScoresController < ApplicationController
  before_filter :check_origin

  def index
    @scores = Score.all.order(score: :desc)
    render :json => @scores
  end

  def create
    @score = Score.new(score_params)
    @score.name = @score.name || "stranger"
    if @score.save
      render 'index'
    else
      render :json => @score.errors, :status => :unprocessable_entity
    end
  end

  private
  def score_params
    params.require(:score).permit(:name, :score)
  end

  def check_origin
    if request.headers['origin'] != 'http://lylyanne.github.io'
      render json: { error: "Unrecognized origin." }
    end
  end
end
