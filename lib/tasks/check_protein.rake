namespace :abc do
	desc "Checks website if the item is lower than set price"
	task :check_protein => :environment do
		require "watir"
		require 'watir-webdriver'
		require 'nokogiri'

		browser = Watir::Browser.new :phantomjs
		browser.goto 'https://www.amazon.com/Optimum-Nutrition-Serious-Banana-Pound/dp/B002DYIZPS/ref=sr_1_1_s_it?s=hpc&ie=UTF8&qid=1468269375&sr=1-1&keywords=optimum+nutrition+serious+mass+banana'
		page_html = Nokogiri::HTML.parse(browser.html)
		entry = page_html.css('.a-color-price')
		element = entry[0]
		html = element.text
		html.sub!(/\D/, "")
		p = html.to_f
		if p < 37.0
			MailgunMailer.protein_notification("#{html}").deliver
		end
	end
end