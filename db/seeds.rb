# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rubygems'
require 'nokogiri'
require 'open-uri'


link = Nokogiri::HTML(open("http://www.languagedaily.com/learn-german/vocabulary/common-german-words"))
linkarray = Array.new
link.xpath(".//div[2]/div/div[1]/ul/li/a/@href").each do |links|
  linkarray << links.text
end

linkarray.each do |link|
  vocab = Nokogiri::HTML(open("http://www.languagedaily.com"+link))
  vocab.xpath(".//*[contains(@class, 'bigLetter')]").each do |word|
    Card.create(original_text: word.text, translated_text: word.xpath(".//following-sibling::td[1]").text)
  end
end
