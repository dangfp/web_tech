class Surfing
  def call(env)
    request = Rack::Request.new(env)
    Rack::File.new('documents').call(env)
    path = request.path
    if path == '/'
      content = File.read("documents/index.html")
      [200, {"Date" => Time.now.ctime}, [content]]
    else
      if File.exists?("documents#{path}")
        content = File.read("documents#{path}")
        [200, {"Date" => Time.now.ctime}, [content]]
      else
        [404, {}, ["Can't locate the document"]]
      end
    end
  end
end
