Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.full_host = Settings.omniauth.full_host
  provider :google_oauth2, Settings.omniauth.google_oauth2_key, Settings.omniauth.google_oauth2_secret, :client_options => {:ssl => { :ca_file => Settings.omniauth.ca_path }}
end
