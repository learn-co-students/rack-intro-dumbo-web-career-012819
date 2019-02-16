class Application

  def call(env)
    resp = Rack::Response.new
    resp.write "Hello, my name is Mazen and I can't wait to be a web creator!"
    resp.finish
  end

end

