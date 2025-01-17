require 'redis'

begin
  $redis = Redis.new(host: 'redis', port: 6379, password: 'password')
  Rails.logger.info("Redis PING: #{$redis.ping}")
rescue => e
  Rails.logger.error("Redis connection error: #{e.message}")
end