#!/usr/bin/env crystal

require "file_utils"

Dir.glob("day*").sort.each do |day|
  puts "Testing #{day}"

  FileUtils.cd(day)
  Process.run(
    "crystal",
    ["spec"],
    output: Process::Redirect::Inherit,
    error: Process::Redirect::Inherit
  )
  FileUtils.cd("..")

  puts
end
