class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'net/http'
  require 'uri'
  require 'rest-client'
  # require 'rubygems'
  require 'json'
end
