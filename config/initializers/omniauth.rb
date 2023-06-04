Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, Rails.application.credentials.dig(:twitter, :api_key), Rails.application.credentials.dig(:twitter, :api_secret)

    provider :github, Rails.application.credentials.dig(:github, :api_key), Rails.application.credentials.dig(:github, :api_secret)
end