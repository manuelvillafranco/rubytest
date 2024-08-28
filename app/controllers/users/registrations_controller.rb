class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

  # El resto del código de tu controlador
end