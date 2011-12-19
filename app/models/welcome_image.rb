class WelcomeImage < ActiveRecord::Base
  has_attached_file :image,
                    :styles => {
                        :list => '121x121#',
                        :welcome => '1920x1080#'
                    },
                    :default_url => '/welcome_images/default.jpg',
                    :url => '/welcome_images/:id/:style_:basename.:extension'
end
