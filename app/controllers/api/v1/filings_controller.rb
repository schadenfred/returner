class Api::V1::FilingsController < ApplicationController
  before_action :set_filing, only: %i[show]

  def index
    @filings = Filing.all
  end

  def show; end

  private

  def set_filing
    @filing = Filing.find(params[:id])
  end

  def filing_params
    params.fetch(:filing, {})
  end
end
