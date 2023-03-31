class ApplicationController < ActionController::Base
  ## For react
  protect_from_forgery with: :null_session
end
