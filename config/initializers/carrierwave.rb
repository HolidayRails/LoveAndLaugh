CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AWSAccessKeyId"],
    aws_secret_access_key: ENV["AWSSecretKey"]
  }
  config.fog_directory  = "love-laugh-playschool-#{Rails.env}"                 # required
  # config.fog_host       = 'https://s3.amazonaws.com'            # optional, defaults to nil
  # config.fog_public     = false                                   # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end