class StaticImage < ActiveRecord::Base
  has_attached_file :image,
                    :styles => {
                        :list => '89x89#',
                        :preview => '136x98#',
                        :inner => '440x290#',
                        :gallery => '800x600#'
                    },
                    :default_url => '/static_images/default.jpg',
                    :url => '/static_images/:id/:style_:basename.:extension'
end
