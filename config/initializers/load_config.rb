# 配置文件载入
APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")[Rails.env]