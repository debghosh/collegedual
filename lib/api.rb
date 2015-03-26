class API < Grape::API

  version 'v1', using: :header, vendor: "CollegeDual"
  format :json
  formatter :json, Grape::Formatter::Rabl

  #basic authentication for API
  #http_basic do |uname, password|
  # user = User.find_by_username(uname)
  # user && user.valid_password?(password)
  #end
  #
  #before do
  # authenticate!
  #end
  #
  #helpers do
  # def authenticate!
  #   error!('Unauthorized. Invalid or expired token.', 401) unless current_user
  # end
  #
  # def current_user
  #   # find token. Check if valid.
  #   token = ApiKey.where(access_token: params[:token]).first
  #   if token && !token.expired?
  #     @current_user = User.find(token.user_id)
  #   else
  #     false
  #   end
  # end
  #end

  resource :api_colleges do
    desc "Return all the Colleges in the System."
    get '/all', rabl: 'all_colleges' do
      @colleges = College.all
    end

  end



end
