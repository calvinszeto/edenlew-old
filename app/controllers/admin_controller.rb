class AdminController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  http_basic_authenticate_with name: ENV['edenlew_name'], password: ENV['edenlew_password']
  force_ssl unless Rails.env.development? || Rails.env.test?

  def index

  end
end