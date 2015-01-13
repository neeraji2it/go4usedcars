Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env == 'development'
    provider :facebook, '489309741123184', 'af02149e8eda81abc3249708f3aba81b', {:scope => 'email,publish_actions,offline_access'}
  elsif Rails.env == 'production'
    provider :facebook, '385660371605927', 'c4cbf53918c3bd9b3a692847138092e3', {:scope => 'email,publish_actions,offline_access'}
  end
end