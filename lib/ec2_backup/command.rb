require 'thor'

module Ec2Backup
  class Command < Thor
    def initialize(*args)
      super(*args)
      Ec2Backup.setup
    end

    desc 'list', "List all running instances"
    def list
      Ec2Backup.instances.each do |instance|
        puts "#{instance.id}: #{instance.tags['Name']}"
      end
    end
  end
end
