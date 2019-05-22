FactoryBot.define do
  factory :photo do
  #   user_id {"1"}
  #
  #
  # pp  photos { Rack::Test::UploadedFile.new(Rails.root.join('/home/dima/rorlections/nedo_insta/spec/support/logo_image.jpg'), 'image/jpg') }
photos { Rack::Test::UploadedFile.new(Rails.root.join('public/logo_image.jpg'), 'image/jpg') }
  #   description {"fotka"}
  end
end
