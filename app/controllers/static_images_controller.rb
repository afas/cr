class StaticImagesController < ApplicationController
  layout false
#  load_and_authorize_resource
  def destroy
    @static_image = StaticImage.find(params[:id])
    @static_image.destroy
  end
end
