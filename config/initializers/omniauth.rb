require 'omniauth'
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FB_APP_ID'], ENV['FB_APP_SECRET']
end

OAuth2::Response.register_parser(:text, 'text/plain') do |body|
    key, value = body.split('=')
    {key => value}
  end
