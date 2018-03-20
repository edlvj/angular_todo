class Users::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    @resource            = resource_class.new(sign_up_params.except(:confirm_success_url))
    @resource.provider   = 'email'
    
    if resource_class.case_insensitive_keys.include?(:username)
      @resource.uid = sign_up_params[:username]
      @resource.username = sign_up_params[:username]
    end  
    
    # honor devise configuration for case_insensitive_keys
    if resource_class.case_insensitive_keys.include?(:email)
      @resource.email = sign_up_params[:email].try :downcase
    else
      @resource.email = sign_up_params[:email]
    end

    # give redirect value from params priority
    #@redirect_url = sign_up_params[:confirm_success_url]

    # fall back to default value if provided
    #@redirect_url ||= DeviseTokenAuth.default_confirm_success_url

    # success redirect url is required
    # if !@redirect_url
    #   return render_create_error_missing_confirm_success_url
    # end

    # if whitelist is set, validate redirect_url against whitelist
    if DeviseTokenAuth.redirect_whitelist
      unless DeviseTokenAuth::Url.whitelisted?(@redirect_url)
        return render_create_error_redirect_url_not_allowed
      end
    end

    begin
      # override email confirmation, must be sent manually from ctrl
     # resource_class.set_callback("create", :after, :send_on_create_confirmation_instructions)
    #  resource_class.skip_callback("create", :after, :send_on_create_confirmation_instructions)
      if @resource.respond_to? :skip_confirmation_notification!
        # Fix duplicate e-mails by disabling Devise confirmation e-mail
        @resource.skip_confirmation_notification!
      end

      if @resource.confirm && @resource.save
        yield @resource if block_given?

        @client_id, @token = @resource.create_token

        @resource.save!

        update_auth_header
        render_create_success
      else
        clean_up_passwords @resource
        render_create_error
      end
    rescue ActiveRecord::RecordNotUnique
      clean_up_passwords @resource
      render_create_error_username_already_exists
    end
  end

  def render_create_error_username_already_exists
    response = {
      status: 'error',
      data:   resource_data
    }
    message = I18n.t('devise_token_auth.registrations.username_already_exists')
    render_error(422, message, response)
  end

  def render_error(status, message, data = nil)
    response = {
      success: false,
      errors: [message]
    }
    response = response.merge(data) if data
    render json: response, status: status
  end
end  
