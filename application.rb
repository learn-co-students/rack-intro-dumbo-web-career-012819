class Application

  def call(env)
    resp = Rack::Response.new
    resp.write "Hello, my name is K R Y S T L E"
    resp.finish
  end

end



