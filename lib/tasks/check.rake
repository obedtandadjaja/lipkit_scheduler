namespace :abc do
	desc "Checks website if the item is available"
	task :check => :environment do
		require "watir"
		require 'watir-webdriver'
		require 'nokogiri'
		browser = Watir::Browser.new :phantomjs
		browser.goto 'http://shop.kyliecosmetics.com/products/candy-k'
		page_html = Nokogiri::HTML.parse(browser.html)
		entry = page_html.css('#AddToCart')
		entry.each do |element|
			if !element.text.include?("Unavailable")
				MailgunMailer.lipkit_notification("Candy-K").deliver
			end
		end

		browser = Watir::Browser.new :phantomjs
		browser.goto 'http://shop.kyliecosmetics.com/products/koko-k'
		page_html = Nokogiri::HTML.parse(browser.html)
		entry = page_html.css('#AddToCart')
		entry.each do |element|
			if !element.text.include?("Unavailable")
				MailgunMailer.lipkit_notification("Koko-K").deliver
			end
		end
	end
end