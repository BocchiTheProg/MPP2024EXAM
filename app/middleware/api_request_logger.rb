class ApiRequestLogger
  def initialize(app)
    @app = app
  end

  # Обов'язковий метод call для middleware
  def call(env)
    # Отримання запиту через RACK
    request = Rack::Request.new(env)
    start_time = Time.now
    # Отримання необхідної інформації для журналу
    status, headers, response = @app.call(env)

    duration = Time.now - start_time
    log_request(request, status, duration)

    # Передаємо далі результати, іншим middleware або самому додатку
    [status, headers, response]
  end

  private

  # Метод для додавання запису
  def log_request(request, status, duration)
    ApiRequestLog.create(
      # Занесення необхідної інформації
      method: request.request_method,
      path: request.path,
      status: status,
      duration: duration,
      ip: request.ip,
      params: request.params.to_json
    )
  end
end
