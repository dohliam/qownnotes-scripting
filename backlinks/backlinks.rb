#!/usr/bin/env ruby

def normalize_link(group, link)
  group_prefix = ""
  if !link.match(/\//)
    group_prefix = group + "/"
  end
  normalize = link
    .downcase
    .gsub(/[\-\s_]/, "")
    .gsub(/\|.*/, "")
  group_prefix + normalize
end

group = ARGV[0]
link = ARGV[1]
notes_path = ARGV[2]
normalized_link = normalize_link(group, link)

@backlinks = {}

files = Dir.glob(notes_path + "/**/*.md")

files.sort.each do |f|
  basename = File.basename(f, ".md")
  page_group = File.basename(File.dirname(f))
  page_full_path = File.absolute_path(f)
  text = File.read(f)
  is_backlink = false
  link_list = text.scan(/\[\[(.*?)\]\]/).flatten
  title = ""
  if text.match(/\A# (.*)/)
    title = Regexp::last_match[1]
  end
  link_list.each do |matched_link|
    normalized_match = normalize_link(page_group, matched_link)
    if normalized_match == normalized_link
      is_backlink = true
      @backlinks[page_full_path] = title
    end
  end
end

heading = "<h2>Backlinks</h2>\n\n<ul>\n" # html format

if @backlinks.length != 0
  puts heading
  @backlinks.each do |backlink_path, backlink_title|
    puts "  <li><a href=\"file://#{backlink_path}\">#{backlink_title}</a></li>"
  end
  puts "</ul>"
end

