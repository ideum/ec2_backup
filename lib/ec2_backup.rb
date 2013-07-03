require "ec2_backup/version"
require "ec2_backup/config"
require 'aws-sdk'

module Ec2Backup
  def self.setup
    cfg = Config.new
    cfg.load_config

    AWS.config(access_key_id: cfg.key, secret_access_key: cfg.secret, region: cfg.region)
  end

  def self.instances
    ec2 = AWS.ec2
    ec2.instances
  end
end
