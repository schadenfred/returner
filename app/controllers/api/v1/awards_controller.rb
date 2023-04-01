class Api::V1::AwardsController < ApplicationController
  before_action :set_award, only: %i[show edit update destroy]

  def index
    @awards = Award.all
  end

  def show; end

  private

  def set_award
    @award = Award.find(params[:id])
  end

  def award_params
    params.fetch(:award, {})
  end
end
