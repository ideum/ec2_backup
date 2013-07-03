require 'yaml'

module Ec2Backup
  class Config
    attr_reader :key, :secret, :region

    def set_config(config)
      config = Hash[config.map{|(k,v)| [k.to_sym,v]}]
      @key = config[:key]
      @secret = config[:secret]
      @region = config[:region]
      nil
    end

    def load_config(filename = nil)
      filename = File.expand_path(filename || "~/.ec2_backup.yml")
      raise "config file not found" unless File.exists? filename

      config = YAML.load_file(filename)
      set_config(config)
    end
  end
end
