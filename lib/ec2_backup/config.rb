require 'yaml'

module Ec2Backup
  class Config
    attr_reader :key, :secret, :region

    def set_config(config)
      @key = config[:key]
      @secret = config[:secret]
      @region = config[:region]
    end

    def load_config(filename = nil)
      filename ||= "~/.ec2_backup.yml"
      raise "config file not found" unless File.exists? filename

      config = YAML.load_file(File.expand_path(filename))
      set_config(config)
    end
  end
end
