class CatchAllController < ApplicationController
  before_action {
    prepend_view_path(Rails.root.join("../../public/").to_s)
  }
  def index
    render "index"
  end
end
