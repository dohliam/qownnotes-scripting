#!/usr/bin/env ruby

# Usage:
#   ./titles_in_folder.rb [note_path]
# (call from within target directory
# or specify directory path)

def basename_to_title(basename)
  basename.capitalize.gsub(/\-/, " ")
end

pwd = Dir.pwd
if ARGV[0]
  pwd = File.absolute_path(ARGV[0])
end

notes = Dir.glob(pwd + "/*.md")

notes.sort.each do |n|
  basename = File.basename(n, ".md")
  content = File.read(n)
  first_line = content.split("\n")[0]
  title = first_line.gsub(/^# /, "")
  if !first_line.match(/^# /)
    title = basename_to_title(basename)
  end
  if basename == title
    puts "* [[#{basename}]]"
  else
    puts "* [[#{basename}|#{title}]]"
  end
end
