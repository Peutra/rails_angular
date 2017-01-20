require "application_responder"

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  self.responder = ApplicationResponder
  respond_to :json
end
