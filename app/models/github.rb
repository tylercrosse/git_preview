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
    binding.pry
  end

end
