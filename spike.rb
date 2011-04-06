#!/usr/bin/env ruby

require 'rubygems'
require 'swish'

# TODO: don't download a shot we already have

(1..10).to_a.each do |page|
  Dribbble::Shot.popular(:page => page, :per_page => 30).each do |shot|
    print "Downloading shot #{shot.id}..."
    File.open("./shots/shot-#{shot.id}.png", "wb") do |file| 
      file.write Net::HTTP.get URI.parse(shot.image_url)
    end
    print" saved!\n"
  end
end

puts "Done!"