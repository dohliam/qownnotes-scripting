#!/usr/bin/env ruby

# Usage:
#   ./backlinks_cli.rb [options] [filename.md]
# (no need to call from root folder)

require 'optparse'

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

def print_backlinks(options)
  heading = "<h2>Backlinks</h2>\n\n<ul>\n" # html format

  if options[:html]
    puts heading
  end

  if @backlinks.length != 0
    @backlinks.each do |backlink_path, backlink_title|
      backlink_group = get_group(backlink_path)
      backlink_link = get_link(backlink_path)

      if options[:html]
        puts "  <li><a href=\"file://#{backlink_path}\">#{backlink_title}</a></li>"
      elsif options[:markdown]
        puts "* [[#{backlink_group}/#{backlink_link}|#{backlink_title}]]"
      elsif options[:plain]
        puts "#{backlink_path}\t#{backlink_title}"
      else
        puts "#{backlink_path}\t#{backlink_title}"
      end
    end

    if options[:html]
      puts "</ul>"
    end

  end
end

def init_links(note_file)
  note_path = File.absolute_path(note_file)
  ext = File.extname(note_file)

  dir_path = File.dirname(note_path)
  group = File.basename(dir_path)
  link = File.basename(note_path, ext)
  @notes_root = File.dirname(dir_path)

  @normalized_link = normalize_link(group, link)

  @backlinks = {}
end

def get_backlinks
  files = Dir.glob(@notes_root + "/**/*.md")

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
      if normalized_match == @normalized_link
        is_backlink = true
        pretty_path = page_full_path.gsub(Dir.home, "~")
        @backlinks[pretty_path] = title
      end
    end
  end
end

def get_group(backlink_path)
  backlink_dir = File.dirname(backlink_path)
  File.basename(backlink_dir)
end

def get_link(backlink_path)
  backlink_ext = File.extname(backlink_path)
  backlink_link = File.basename(backlink_path, backlink_ext)
end

if __FILE__==$0
  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: ./backlinks_cli [options] [filename]"

    opts.on("-l", "--use-html", "Output results in HTML format") { options[:html] = true }
    opts.on("-m", "--markdown", "Output results in markdown format with wikilinks") { options[:markdown] = true }
    opts.on("-p", "--plain-text", "Output results in plain text") { options[:plain] = true }

  end.parse!

  note_file = ARGV[0]

  init_links(note_file)
  get_backlinks
  print_backlinks(options)
end
