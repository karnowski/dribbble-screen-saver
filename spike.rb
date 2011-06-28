#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'swish'

(1..10).to_a.each do |page|
  Dribbble::Shot.popular(:page => page, :per_page => 30).each do |shot|
    filename = "./shots/shot-#{shot.id}.png"
    
    if File.exist?(filename)
      puts "#{filename} already exists!  Skipping."
      next
    end
    
    print "Downloading shot #{shot.id}..."
    File.open(filename, "wb") do |file| 
      file.write Net::HTTP.get URI.parse(shot.image_url)
    end
    print" saved!\n"
  end
end

puts "Done!"