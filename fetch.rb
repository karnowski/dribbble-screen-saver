#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'swish'

if ARGV.length > 0 && ARGV.first == "--new"
  require 'fileutils'
  iso_date = Time.now.strftime("%Y-%m-%d-%H:%M:%S")
  FileUtils::mv "./shots", "./shots-#{iso_date}", :verbose => true if File.exist?("./shots")
  FileUtils::mkdir_p "./shots", :verbose => true
end

(1..10).to_a.each do |page|
  puts "Reading page #{page} of 10..."
  Dribbble::Shot.popular(:page => page, :per_page => 30).each do |shot|
    filename = "./shots/shot-#{shot.player.username}-#{shot.id}.png"

    if File.exist?(filename)
      puts "#{filename} already exists!  Skipping."
      next
    end
    
    print "Downloading shot #{shot.id} by #{shot.player.username}..."
    File.open(filename, "wb") do |file| 
      file.write Net::HTTP.get URI.parse(shot.image_url)
    end
    print" saved!\n"
  end
end

puts "Done!"