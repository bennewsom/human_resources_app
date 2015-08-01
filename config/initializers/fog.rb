CarrierWave.configure do |config|
  config.storage :fog

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => '',                        # required
    :aws_secret_access_key  => '',                        # required
    :region => ""
  }
 
  config.fog_directory  = 'benhrappimages'                          # required
  config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end