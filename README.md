# Git Preview
## How It Works
## Installation

```
git clone git@github.com:cpgruber/map-db.git
cd map-db
bundle install
rake db:create
rake db:migrate
rake db:seed
rails server
```

You will need to add a `env.js` file to the root directory, and add your own Facebook developer credentials (sign up at [Facebook for Developers](https://developers.facebook.com)):

```
module.exports = {
  GITHUB_KEY: "[YOUR ID]",
  GITHUB_SECRET: "[YOUR SECRET KEY]",
  aws_access_key_id: "[YOUR ID]",
  aws_access_key_key: "[YOUR SECRET KEY]"
};
```

## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## Credits
- Developed by Tyler Crosse
- Inspiration from Mike Bostock
