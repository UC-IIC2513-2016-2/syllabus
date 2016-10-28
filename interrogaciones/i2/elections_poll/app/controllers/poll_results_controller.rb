class PollResultsController < ApplicationController
  def index
    @municipalities = Municipality.all
  end
end
