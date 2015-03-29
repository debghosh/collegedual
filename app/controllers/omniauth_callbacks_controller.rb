class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    auth = request.env["omniauth.auth"]

    unless auth.credentials.token.blank?
      @user = User.where(:email => auth.info.email).first
      auth_values = auth.extra.raw_info
      if @user.blank?
        @new_user = User.new(:email => auth.info.email, :uid => auth.uid,
                                :password => Digest::SHA2.hexdigest(Time.now.to_s), provider:auth.provider)
        @new_user.skip_confirmation!
        @new_user.save
        @new_user.create_facebook_access_token(:access_token => auth.credentials.token)
        sign_in @new_user, :event => :authentication
      else
        @user.facebook_access_token.blank? ? (@user.create_facebook_access_token(:access_token => auth.credentials.token)) : (@user.facebook_access_token.update(:access_token => auth.credentials.token))
        sign_in @user, :event => :authentication
      end
    else
      flash[:alert] = 'You need to permit the app to access your facebook credential'
    end
    redirect_to root_path
  end
end