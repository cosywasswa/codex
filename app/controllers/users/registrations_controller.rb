class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  respond_to :json

  private

  def respond_with(resource, _options = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'signed up successfuly',
                  data: resource }
      }, status: :ok
    else
      render json: {
        status: { message: 'user not signed up', errors: resource.errors.full_messages }
      }, status: :unprocessable_entity
    end
  end
end
