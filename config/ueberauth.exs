use Mix.Config

config :ueberauth, Ueberauth,
  providers: [
    facebook: {Ueberauth.Strategy.Facebook, []},
    github: {Ueberauth.Strategy.Github, [default_scope: "user:email"]},
    google: {Ueberauth.Strategy.Google, [default_scope: "email profile"]},
    identity:
      {Ueberauth.Strategy.Identity,
        [
          callback_methods: ["POST"],
          uid_field: :username,
          nickname_field: :username,
        ]},
    slack: {Ueberauth.Strategy.Slack, []},
    twitter: {Ueberauth.Strategy.Twitter, []}
  ]

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FACEBOOK_APP_ID"),
  client_secret: System.get_env("FACEBOOK_APP_SECRET"),
  redirect_uri: System.get_env("http://localhost:4000/auth/facebook/callback")

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("https://localhost:4000/auth/github/callback")

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET"),
  redirect_uri: System.get_env("http://localhost:4000/auth/google/callback")

config :ueberauth, Ueberauth.Strategy.Slack.OAuth,
  client_id: System.get_env("SLACK_CLIENT_ID"),
  client_secret: System.get_env("SLACK_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.Twitter.OAuth,
  consumer_key: System.get_env("TWITTER_CONSUMER_KEY"),
  consumer_secret: System.get_env("TWITTER_CONSUMER_SECRET")
