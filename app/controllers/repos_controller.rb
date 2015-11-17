class ReposController < ApplicationController
  def show
  end

  def index
    github_info = {user_id: session[:user_id], token: session[:token]}
    Github.new(github_info).get_repos
  end
end
