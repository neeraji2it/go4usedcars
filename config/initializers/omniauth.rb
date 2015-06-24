Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env == 'development'
    provider :facebook, '489309741123184', 'af02149e8eda81abc3249708f3aba81b', {:scope => 'email,publish_actions,offline_access'}
  elsif Rails.env == 'production'
    provider :facebook, '1617640621812845', '6bc7fbebf63619676538ee38d0baae29', {:scope => 'email,publish_actions,offline_access'}
  end
end