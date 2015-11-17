class Github
  include HTTParty
  base_uri 'https://api.github.com'
  attr_reader :user_id, :token

  def initialize(github_info)
    @user_id = github_info[:user_id]
    @token = github_info[:token]
    @headers = {"Authorization" => "token #{@token}",
                "User-Agent" => User.find_by(id: @user_id).nickname }
  end

  def get_user
    response = HTTParty.get("https://api.github.com/user", :headers => @headers)
  end

  def get_repos
    response = HTTParty.get("https://api.github.com/user/repos", :headers => @headers)
    Repo.create(
      rid: response[0]["id"],
      name: response[0]["name"],
      full_name: response[0]["full_name"],
      user_id: user.id,
      html_url: response[0]["html_url"],
      description: response[0]["description"],
      owner: response[0]["owner"]["login"],
      owner_avatar_url: response[0]["owner"]["avatar_url"],
      owner_html_url: response[0]["owner"]["html_url"]
    )
  end

end
