class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    # update this to browse matches if we can't get v2 to work
    '/user_genres/new'
  end

end
