class Api::V1::FilersController < ApplicationController
  def index
    @filers = Org.filers
  end
end
