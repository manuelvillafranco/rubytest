require "active_support/core_ext/integer/time"

RRails.application.configure do
  # Configura el host de tu aplicación
  config.hosts << "vmi2082458.contaboserver.net"

  # Asegúrate de que los logs se mantengan en un nivel adecuado
  config.log_level = :info

  # Compresión de archivos CSS y JS para mejorar el rendimiento
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass

  # Configurar la entrega de correos electrónicos
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    user_name: ENV["SMTP_USERNAME"],
    password: ENV["SMTP_PASSWORD"],
    authentication: "plain",
    enable_starttls_auto: true
  }

  # Configuración de CORS si estás usando una API
  config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'
      resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
    end
  end
end
