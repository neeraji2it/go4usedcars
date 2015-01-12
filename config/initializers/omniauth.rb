Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '489309741123184', 'af02149e8eda81abc3249708f3aba81b', {:scope => 'email,publish_actions,offline_access'}
end