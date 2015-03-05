CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AWSAccessKeyId"],
    aws_secret_access_key: ENV["AWSSecretKey"]
  }
  config.fog_directory = "lovelaugh"
  # config.fog_public     = true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end