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
  title = basename_to_title(basename)
  first_line = content.split("\n")[0]
  if first_line && first_line.match(/^# /)
    title = first_line.gsub(/^# /, "")
  end
  if basename.downcase == title.downcase
    puts "* [[#{title}]]"
  else
    puts "* [[#{basename}|#{title}]]"
  end
end
