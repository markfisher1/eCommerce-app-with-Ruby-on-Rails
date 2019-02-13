CarrierWave.configure do |config|
  config.storage                             = :gcloud
  config.gcloud_bucket                       = ENV['GOOGLE_BUCKET']
  config.gcloud_bucket_is_public             = true
  config.gcloud_authenticated_url_expiration = 600
  # config.gcloud_content_disposition          = 'attachment' // or you can skip this

  config.gcloud_attributes = {
    expires: 600
  }

  config.gcloud_credentials = {
    gcloud_project: ENV['GOOGLE_PROJECT'],
    gcloud_keyfile: JSON.parse(ENV['GOOGLE_CLIENT_SECRETS'])
  }
end
