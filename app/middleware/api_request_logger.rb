class ApiRequestLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    start_time = Time.now

    status, headers, response = @app.call(env)

    duration = Time.now - start_time
    log_request(request, status, duration)

    [status, headers, response]
  end

  private

  def log_request(request, status, duration)
    ApiRequestLog.create(
      method: request.request_method,
      path: request.path,
      status: status,
      duration: duration,
      ip: request.ip,
      params: request.params.to_json
    )
  end
end
