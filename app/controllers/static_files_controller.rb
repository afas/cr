class StaticFilesController < ApplicationController
  layout false
#  load_and_authorize_resource
  def destroy
    @static_file = StaticFile.find(params[:id])
    @static_file.destroy
  end
end
