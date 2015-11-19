class CommitsController < ApplicationController
  def index
    @user = current_user
    @user_id = params[:user_id]
    @nickname = current_user.nickname
    @repo_id = params[:repo_id]
    @repo = Repo.find_by(id: @repo_id)
    @repo_name = @repo.name
    #store info in variable to pass to app/models/github.rb
    github_info = {user_id: session[:user_id],
                  nickname: @nickname,
                  token: session[:token],
                  repo_id: @repo_id,
                  repo_name: @repo_name}
    Github.new(github_info).get_commits
    @commits = @repo.commits.all.order(committer_date: :desc)
    # @commits = Commit.find_by(user_id: @user_id, repo_id: @repo_id)
  end

  def show
    @user = current_user
    @repo = Repo.find(params[:repo_id])
    @commit = @repo.commits.find(params[:id])
    @commits = @repo.commits.all.order(committer_date: :desc)
    @previous_commit = @commits.where('commits.committer_date < ?', @commit.committer_date).first
    @next_commit = @commits.where('commits.committer_date > ?', @commit.committer_date).first
  end

  # def create
  #   @user = current_user
  #   @repo = Repo.find(params[:repo_id])
  #   @commit = @repo.commits.find(params[:id])
  #   @commit.create(commit_params)
  # end

  def edit
    @user = current_user
    @repo = Repo.find(params[:repo_id])
    @commit = @repo.commits.find(params[:id])
  end

  def update
    @user = current_user
    @repo = Repo.find(params[:repo_id])
    @commit = @repo.commits.find(params[:id])
    @commit.update(commit_params)

    redirect_to user_repo_commits_path(@user, @repo)
  end

  private
    def commit_params
      params.require(:new_commit).permit(:image)
    end
end
