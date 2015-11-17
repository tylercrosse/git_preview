class CommitsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @nickname = User.find_by(id: @user_id).nickname
    @repo_id = params[:repo_id]
    @repo_name = Repo.find_by(id: @repo_id).name
    github_info = {user_id: session[:user_id],
                  nickname: @nickname,
                  token: session[:token],
                  repo_id: @repo_id,
                  repo_name: @repo_name}
    Github.new(github_info).get_commits
    @commits = Commit.all
  end
end
