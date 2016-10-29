class AnswersController < ApplicationController
  before_action :set_municipality

  def new
    @answer = Answer.new
    @candidates = Candidate.where(municipality: @municipality)
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.municipality = @municipality
    @answer.save
    redirect_to root_path
  end

  private

  def answer_params
    params.require(:answer).permit(:will_vote, :voted_past_election, :politics_satisfaction, :preferred_candidate_id)
  end

  def set_municipality
    @municipality = Municipality.find(params[:municipality_id])
  end
end
