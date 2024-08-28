class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Omitir la verificación del token CSRF para solicitudes JSON
  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

  # Configurar Devise para responder a solicitudes JSON
  respond_to :json
end
