CarrierWave.configure do |config|
  config.remove_previously_stored_files_after_update = false

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['S3_KEY'],
    aws_secret_access_key: ENV['S3_SECRET'],
    region: ENV['S3_REGION']
  }

  if Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  config.fog_directory = ENV['S3_BUCKET_NAME']
end