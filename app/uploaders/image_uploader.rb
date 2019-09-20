class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #if Rails.env.production?
  include Cloudinary::CarrierWave
  #else
   # storage :file #cloudinaryを入れる
  #end 
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  #def store_dir
  #  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #end
  
  #def cache_dir
  #    "#{Rails.root}/spec/support/uploads/tmp"
  #end 

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end
  process :resize_to_fit => [700, 700]
  process :convert => 'jpg'
  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end


  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_limit => [300, 300]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end


  def filename
    if original_filename.present?
      time = Time.now
      name = time.strftime('%Y%md%H%M%S') + '.jpg'
      name.downcase
    end
  end 
  
  def public_id
    return model.id
  end
  
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
