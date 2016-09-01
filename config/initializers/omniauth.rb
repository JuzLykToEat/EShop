OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '310636842623006', 'f98dd4dda6271becbb7c8c25e4179897',
  scope: 'public_profile,email', info_fields: 'name,email', display: 'popup'
end
