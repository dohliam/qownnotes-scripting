#!/usr/bin/env ruby

# Usage:
#   ./random_note.rb [note_path]
# (call from within target directory
# or specify directory path)

pwd = Dir.pwd
if ARGV[0]
  pwd = File.absolute_path(ARGV[0])
end

notes = Dir.glob(pwd + "/**/*.md")

shuffled_notes = notes.shuffle
random_note = shuffled_notes[9]

group = File.basename(File.dirname(random_note))
title = File.basename(random_note, ".md")
link = group + "/" + title

puts link

exec("less #{random_note}")
