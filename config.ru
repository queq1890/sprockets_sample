require 'sprockets'
require 'therubyracer'
require 'coffee-script'
require 'sass'

# sprocketsはアセットファイルを配置するパスを管理してあたかも1つのディレクトリにあるかのようにアクセスする機能を提供する
# localhost:9292/assets/hello.js
# localhost:9292/sample.css

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  run environment
end

map '/' do
  run Proc.new {|env| [200, {"content-type" => "text/hyml"}, ["Hello World"]]}
end
