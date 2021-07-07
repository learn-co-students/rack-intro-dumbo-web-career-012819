class Application

  def call(env)
    resp = Rack::Response.new
    resp.write "Hello, my name is Manuela Sanchez"
    resp.finish
  end

end
