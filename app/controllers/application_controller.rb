class ApplicationController < ActionController::API
  prepend_view_path '../public/'
  helper: authentication
  def index
  end
end
