class Api::ScoresController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :check_origin

  def index
    @scores = Score.order(score: :desc, created_at: :desc).all
    render :json => @scores
  end

  def create
    @score = Score.new(score_params)
    @score.name = @score.name || "visitor"
    if @score.save
      render :json => @score, :status => :created
    else
      render :json => @score.errors, :status => :unprocessable_entity
    end
  end

  private
  def score_params
    params.require(:scores).permit(:name, :score)
  end

  def check_origin
    if request.headers['origin'] != 'https://lylyanne.github.io'
      render json: { error: "Unrecognized origin." }
    end
  end
end
