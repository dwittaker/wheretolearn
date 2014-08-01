class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    #@user = User.from_omniauth(request.env["omniauth.auth"], "facebook")
    @user = User.find_for_oauth(request.env["omniauth.auth"], "facebook")


    if defined? @user && @user.persisted?
      sign_in_and_redirect @user#, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def twitter
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    #@user = User.from_omniauth(request.env["omniauth.auth"], "twitter")
    @user = User.find_for_oauth(request.env["omniauth.auth"], "twitter")

log_test('here')


    if defined? @user && @user.persisted?
      log_test('here inside')
      sign_in_and_redirect @user #,  :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      log_test('here in else')
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end

    log_test('here after block')
  end

  def log_test(message)
    Rails.logger.info(message)
    puts message
  end
end