#!/usr/bin/env crystal

require "file_utils"
require "ecr"

if ARGV.size < 2
  puts "no name specified"
  puts "usage ./gen.cr DAY MODULE_NAME"
  exit
end

name = ARGV[1]
day = ARGV[0]

class Template
  @@path : String = ""

  def self.path=(p)
    @@path = p
  end

  def self.path
    @@path
  end
end

macro template(from, relative_to, name)
  {{ class_name = run("./generate_class_name.cr") }}

  class {{ class_name.id }} < Template
    @name : String
    @file_path : String

    ECR.def_to_s {{ from }}

    def initialize(@name)
      @file_path = File.join(@@path, {{ relative_to }})
    end

    def touch
      File.touch(@file_path)
    end

    def write
      File.open(@file_path, mode: "w") do |file|
        file << self
      end
    end
  end

  {{class_name.id}}.path = Template.path
  t = {{class_name.id}}.new({{ name }})
  t.touch
  t.write
end

path = sprintf("day%02s", day)

FileUtils.mkdir_p("#{path}")
FileUtils.mkdir_p("#{path}/spec")
FileUtils.mkdir_p("#{path}/src")
File.touch("#{path}/input")
File.touch("#{path}/prompt.md")

Template.path = path
template "template/shard.yml.ecr", "shard.yml", name
template "template/spec.cr.ecr", "spec/#{name.downcase}_spec.cr", name
template "template/cli.cr.ecr", "src/cli.cr", name
template "template/base.cr.ecr", "src/#{name.downcase}.cr", name
