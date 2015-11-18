class ReposController < ApplicationController
  def show
  end

  def index
    @user = User.find(params[:user_id]) #not used yet
    github_info = {user_id: session[:user_id], token: session[:token]}
    Github.new(github_info).get_repos
    @repos = @user.repos.all
  end
end
