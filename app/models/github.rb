class Github
  include HTTParty
  base_uri 'https://api.github.com'
  attr_reader :user_id, :nickname, :token, :repo_id, :repo_name

  def initialize(github_info)
    @user_id = github_info[:user_id]
    @nickname = github_info[:nickname]
    @token = github_info[:token]
    @repo_id = github_info[:repo_id]
    @repo_name = github_info[:repo_name]
    @headers = {"Authorization" => "token #{@token}",
                "User-Agent" => User.find_by(id: @user_id).nickname }
  end

  def get_user
    response = HTTParty.get("https://api.github.com/user", :headers => @headers)
  end

  def get_repos
    response = HTTParty.get("https://api.github.com/user/repos", :headers => @headers)
    response .each do |response|
      Repo.create(
        rid: response["id"],
        name: response["name"],
        full_name: response["full_name"],
        user_id: @user_id,
        html_url: response["html_url"],
        description: response["description"],
        owner: response["owner"]["login"],
        owner_avatar_url: response["owner"]["avatar_url"],
        owner_html_url: response["owner"]["html_url"]
      )
    end
  end

  def get_commits
    response = HTTParty.get("https://api.github.com/repos/#{@nickname}/#{@repo_name}/commits", :headers => @headers)
    response .each do |response|
      Commit.create(
        sha: response["sha"],
        committer_name: response["commit"]["committer"]["name"],
        committer_date: response["commit"]["committer"]["date"],
        committer_avatar_url: response["committer"]["avatar_url"],
        commit_message: response["commit_message"],
        url: response["url"],
        html_url: response["html_url"],
        user_id: @user_id,
        repo_id: @repo_id
      )
    end
  end

end
