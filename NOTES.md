# Rack
a ruby gem that helps create a web server at its simplest.

what Ruby on Rails is built on top of.

# Setting up Rack

To work with Rack, create a new class that responds to a single method: `#call`.

All this method needs to do is return a response which consists of the status code, any headers, and the body.

This can all be done using the `Rack::Response` object.

1. create a `Rack::Response` object
2. add some text "Hello, World" to the body
3. complete the response with the `#finish` method.

By default, Rack sets our status codes and headers. Don't worry about the `env` input. This holds all of the *request* info in it

```ruby
class Application

  def call(env)
    resp = Rack::Response.new
    resp.write "Hello, World"
    resp.finish
  end

end
```

The above code will run whenever there is a request received.

```ruby
#config.ru
require_relative "./application.rb"

run Application.new
```

Then you must set up an HTTP web server that will:
* receive the HTTP request,
* send it through the above `#call` method,
* and then serve the response to the browser.

We do this using a `config.ru` file and the `rackup` command.

Run:
$ rackup config.ru

Your `config.ru` file should look like this:
```
[2015-11-27 16:48:22] INFO  WEBrick 1.3.1
[2015-11-27 16:48:22] INFO  ruby 2.1.3 (2014-09-19) [x86_64-darwin13.0]
[2015-11-27 16:48:22] INFO  WEBrick::HTTPServer#start: pid=11275 port=9292
```

Notice it says `port=9292`.
If you open your browser and go to `http://localhost:9292/` you should see `Hello, World`.

# url breakdown: http://localhost:9292/
The protocol is `http`.
The domain is `localhost:9292`.

since you are running the server on your computer, `localhost` is the server name of your own computer.

Nobody else can get that URL though.

The last part of that URL is the `:9292` section.
This is the "port number" of your server.

Don't worry too much about this, but you may want to run multiple servers on one computer and having different ports allows them to be running simultaneously without conflicting.

The resource that you are requesting is `/`.
This is effectively like saying the home or default.
