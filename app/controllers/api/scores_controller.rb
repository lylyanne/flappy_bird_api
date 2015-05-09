class Api::ScoresController < ApplicationController
  before_filter :set_cors

  def index
    @scores = Score.all
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

  def set_cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = 'POST'
  end
end
