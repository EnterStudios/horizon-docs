#!/usr/bin/ruby

# Usage: ./build.rb <targetdir>
# Example: ./build.rb public/horizon-docs

require 'fileutils'

target_dir = ARGV[0]

bodyenter = File.binread("pieces/enter.txt")
bodyexit = File.binread("pieces/exit.txt")

blacklist = ['README.md']

puts "mkdir #{target_dir}/"
Dir.mkdir(target_dir)
Dir.glob("**/*") { |filename|
  if File.directory?(filename)
    dest_filename = "#{target_dir}/#{filename}"
    puts "#{filename} -> #{dest_filename}"
    Dir.mkdir(dest_filename)
  else
    data = File.binread(filename)
    if blacklist.include?(filename)
      puts "ignore #{filename}"
    elsif /\.md$/ =~ filename
      header_match = /^---\n(?:\w+:.*\n)*---\n/.match(data)
      if header_match == nil
        raise "File #{filename} lacks valid header"
      end
      header = header_match[0]
      content = header_match.post_match
      permalink_match = /^permalink: (\/[-\w\.\/]*)$/.match(header)
      if permalink_match == nil
        raise "File #{filename} header lacks permalink"
      end
      permalink = permalink_match[1]

      title_match = /^title:\s+(.*)$/.match(header)
      if title_match == nil
        raise "File #{filename} header lacks title"
      end
      title = title_match[1]

      dest_filename = "#{target_dir}#{permalink}"
      puts "#{filename} -> #{dest_filename}"
      dest_dirname = File.dirname(dest_filename)

      root = (['.'] + ([".."] * (permalink.count('/') - 1))).join('/')

      FileUtils.mkdir_p(dest_dirname)

      converted = IO.popen("kramdown -i GFM --no-hard-wrap --coderay-line-numbers nil --toc-levels 1,2", mode="r+b") { |f|
        f.write(content)
        f.close_write()
        f.read()
      }

      final = bodyenter + converted + bodyexit
      final = final.gsub('$$ROOT$$', root)
      final = final.gsub('$$TITLE$$', title)

      File.binwrite(dest_filename, final)
    else
      dest_filename = "#{target_dir}/#{filename}"
      puts "#{filename} -> #{dest_filename}"
      File.binwrite(dest_filename, data)
    end
  end
}
