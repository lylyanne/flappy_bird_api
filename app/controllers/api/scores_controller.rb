class Api::ScoresController < ApplicationController
  before_action :set_cors, :only => [:index, :create]

  def index
    @scores = Score.all
    render :json => @scores
  end

  def create
    @score = Score.new(score_params)
    @score.name = @score.name || "stranger"
    if @score.save
      render :json => @score
    else
      render :json => @score.errors, :status => :unprocessable_entity
    end
  end

  private
  def score_params
    params.require(:score).permit(:name, :score)
  end

  def set_cors
    headers['Access-Control-Allow-Origin'] = "*"
  end
end
