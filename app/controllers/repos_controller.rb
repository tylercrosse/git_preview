class ReposController < ApplicationController
  def show
  end

  def index
    github_info = {user_id: session[:user_id], token: session[:token]}
    binding.pry
    Github.new(github_info).get_user
  end
end
