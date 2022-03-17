#!/usr/bin/env ruby

# Usage:
#   ./note_stats.rb [note_path]
# (call from within target directory
# or specify directory path)

require_relative 'backlinks_cli.rb'

pwd = Dir.pwd
if ARGV[0]
  pwd = File.absolute_path(ARGV[0])
end

notes = Dir.glob(pwd + "/**/*.md")

number_of_notes = notes.length

puts "==Total number of notes==", number_of_notes
puts

@number_of_links = {}

puts "==Top notes by number of inbound links=="

notes.each do |note_file|
  init_links(note_file)
  group = get_group(note_file)
  link = get_link(note_file)
  internal_link = group + "/" + link

  get_backlinks
  num = @backlinks.length
  @number_of_links[internal_link] = num
end

sorted_by_num = @number_of_links.sort_by {|link, num| num }

@orphaned_links = []

sorted_by_num.each do |link, num|
  if num > 1
    puts "[#{num.to_s}]: #{link}"
  elsif num == 0
    @orphaned_links << link
  end
end

puts
puts "==Orphaned links=="
puts @orphaned_links
