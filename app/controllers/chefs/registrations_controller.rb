# frozen_string_literal: true

module Chefs
  class RegistrationsController < Devise::RegistrationsController
    # before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]

    def new
      @chef = Chef.new
    end

    def create
      @chef = Chef.new(sign_up_params)
      render :new and return unless @chef.valid?

      session['devise.regist_data'] = { user: @chef.attributes }
      session['devise.regist_data'][:user]['password'] = params[:chef][:password]
      @profile = @chef.build_profile
      render :new_profile
    end

    def create_profile
      @chef = Chef.new(session['devise.regist_data']['user'])
      @profile = Profile.new(profile_params)
      render :new_profile and return unless @profile.valid?

      # @chef.build_profile(@profile.attributes)
      @chef.save
      @profile.chef_id = @chef.id
      @profile.save
      @chef.save
      session['devise.regist_data']['user'].clear
      sign_in(:chef, @chef)
      redirect_to root_path
    end
    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # def create
    #   super
    # end

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

    private

    # def sign_up_params
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :zip_code, :prefecture_id, :district, :street, :phone_number])
    # end

    def profile_params
      params.require(:profile).permit(:image, :about, :business_hour_begin, :business_hour_end, :status_id,
                                      :gender_id, :age_id, :genre_id)
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_up_params
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    # end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
