class Api::V1::FilersController < ApplicationController
  before_action :set_filer, only: %i[show]

  def index
    @filers = Org.filers
  end

  def show; end

  private

  def set_filer
    @filer = Org.find(params[:id])
  end

  def filing_params
    params.fetch(:filer, {})
  end
end
