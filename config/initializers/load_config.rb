# 配置文件载入
APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")[Rails.env]

# 自动加载 config.autoload_paths 的文件
Chuckblog::Application.config.autoload_paths.each do |c|
  Dir["#{c}/*.rb"].each { |f| require f }
end