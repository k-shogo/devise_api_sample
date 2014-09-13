class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)

        respond_to do |format|
          format.html { respond_with resource, location: after_sign_up_path_for(resource)}
          format.json { render json: resource}
        end
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!

        respond_to do |format|
          format.html { respond_with resource, location: after_inactive_sign_up_path_for(resource)}
          format.json { render json: resource}
        end
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end

      respond_to do |format|
        format.html { respond_with resource}
        format.json { render json: {errors: resource.errors.full_messages}, status: :unprocessable_entity}
      end
    end
  end
end
