class UserBloodDonators::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @resourceT = "blood-donator"
    super
  end

  # POST /resource
  def create
    super

    if UserBloodDonator.find_for_authentication(cpf: params[:document])
      send_notification
    end

  end

  def made_donation
    puts "JA DOEI"
    puts "JA DOEI"
    puts "JA DOEI"
    puts "JA DOEI"
    puts "JA DOEI"
    puts "JA DOEI"
    puts "JA DOEI"
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :cpf, :date_birth,
      :phone, :password, :notification,
      :genre, :blood_type, :admin,
      :last_donation, :cep, :long, :lat])
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end
    # The path used after sign up.
    def after_sign_up_path_for(resource)
      dashboard_path
    end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end

    protected
    def get_donators
      all_user_blood_donators = UserBloodDonator.all
    end

    def send_notification
      NotificationMailer.send_email.deliver_now
    end

    def teste_chamada
      NotificationMailer.get_donators
    end

  end
