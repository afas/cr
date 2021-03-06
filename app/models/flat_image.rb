class FlatImage < ActiveRecord::Base

  belongs_to :flat

  has_attached_file :image,
                    :styles => {
                        :list => '89x89#',
                        :preview => '136x98#',
                        :inner => '580x380#',
                        :gallery => '800x600#'
                    },
                    :default_url => '/flat_images/default.png',
                    :url => '/flat_images/:id/:style_:basename.:extension'
end
