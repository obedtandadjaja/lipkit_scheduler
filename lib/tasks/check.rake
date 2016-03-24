namespace :abc do
	desc "Checks website if the item is available"
	task :check => :environment do
		# require 'mechanize'
		# agent = Mechanize.new
		# page = agent.get "http://shop.kyliecosmetics.com/products/candy-k"
		# puts page.search("#AddToCart") # Search for specific elements by XPath/CSS using nokogiri
		# require 'rubygems'
		# require 'windmill'
		# session = Windmill::Client.new("http://shop.kyliecosmetics.com/products/candy-k")
		# puts session.include?("Unavailable")
		require "watir"
		require 'watir-webdriver'
		require 'nokogiri'
		browser = Watir::Browser.new :phantomjs
		browser.goto 'http://shop.kyliecosmetics.com/products/candy-k'
		page_html = Nokogiri::HTML.parse(browser.html)
		entry = page_html.css('#AddToCart')
		puts entry
	end
end