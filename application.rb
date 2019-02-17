class Application

  def call(env)
    resp = Rack::Response.new
    resp.write "Hello, my name is Nate Hunter"
    resp.finish
  end

end
