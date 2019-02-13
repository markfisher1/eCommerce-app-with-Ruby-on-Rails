CarrierWave.configure do |config|
  config.storage                             = :gcloud
  config.gcloud_bucket                       = 'gomes-commerce'
  config.gcloud_bucket_is_public             = true
  config.gcloud_authenticated_url_expiration = 600
  # config.gcloud_content_disposition          = 'attachment' // or you can skip this

  config.gcloud_attributes = {
    expires: 600
  }

  config.gcloud_credentials = {
    gcloud_project: 'railsapp01',
    gcloud_keyfile: JSON.parse(ENV['GOOGLE_CLIENT_SECRETS'])
  }
end
