Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Figaro.env.github_client_id, Figaro.env.github_client_secret
  provider :facebook, Figaro.env.facebook_client_id, Figaro.env.facebook_client_secret, display: :popup 
end