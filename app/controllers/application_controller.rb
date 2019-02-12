class ApplicationController < ActionController::Base
  before_action :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    # lets DRY
    customParams = [
      :first_name,
      :last_name,
      :username,
      :street_name,
      :zipcode,
      :house_number,
      :country,
      :city,
      :email
    ]
    # lets enable our own EDITING parameters for user table, shall we?
    devise_parameter_sanitizer.permit :account_update, keys: customParams

    # lets enable our own REGISTRATION parameters for user table, shall we?
    devise_parameter_sanitizer.permit :sign_up, keys: customParams

    # lets enable our own parameters for login
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password, :password_confirmation]

  end
  # end of configure_devise_params

  # here we define where the user goes after login
  def after_sign_in_path_for(resource)
    # lets play
    # if the user has not first_name & last_name defined on our DB
    # lets bring him to '/edit' and flash[:notice] to encourage them
    # to fill in data

    # lets get user
    user =  User.find(current_user.id)

    if user.first_name == nil || user.last_name == nil
      # user has at least 1 empty field from naming paramters
      # set notice
      flash[:notice] = "
        Welcome!
        <br>
        It looks like your profile needs some more information before you can do any purchase.
        <br>
        Please fill in your first and last name to associate your purchases.
        ".html_safe
      # redirect to user_registration_path
      edit_user_registration_path(current_user.id)
    else
      user_path(current_user.id)
    end

  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end

end
