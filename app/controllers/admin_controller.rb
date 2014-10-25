class AdminController < ApplicationController
  http_basic_authenticate_with username: ENV['edenlew_username'], password: ENV['edenlew_password']
  force_ssl

  def index

  end
end