class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate, except: :index
  def index
  end

  # http_basic_authenticate_with name: 'admin', password: '12345' except: :index

  # def authenticate
  #   authenticate_token || render_unauthorized
  # end

  # def authenticate_token
  #   authenticate_with_http_token do |token, options|
  #     User.find_by(token: token)
  #   end
  # end

  # def render_unauthorized
  #   self.headers['WWW-Authenticate'] = 'Token realm="Application"'
  #   respond_to do |format|
  #     format.json { render json: "error", status: 401 }
  #   end
  # end
end
