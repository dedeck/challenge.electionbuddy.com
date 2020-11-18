class AuditsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_election
  def index
    @audits = Audit.where(election: @election).order(created_at: :desc)
  end

  def set_election
    @election = Election.find(params[:election_id])
  end
end
