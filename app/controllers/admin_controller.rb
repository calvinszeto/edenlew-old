class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV['edenlew_name'], password: ENV['edenlew_password']
  force_ssl

  def index

  end
end