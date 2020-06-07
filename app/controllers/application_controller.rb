# frozen_string_literal: true

# Superclass for all other controllers
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
