CarrierWave.configure do |config|
  config.storage :fog

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJZ2YLUSA7K5JXN2Q',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region => "ap-southeast-2"
  }
 
  config.fog_directory  = 'benhrappimages'                          # required
  config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end