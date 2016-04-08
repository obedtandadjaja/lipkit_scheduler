namespace :abc do
	desc "Checks website if the item is lower than set price"
	task :check_protein => :environment do
		require "watir"
		require 'watir-webdriver'
		require 'nokogiri'

		browser = Watir::Browser.new :phantomjs
		browser.goto 'http://www.amazon.com/gp/product/B000GIPJ0M/ref=s9_simh_gw_g121_i1_r?ie=UTF8&fpl=fresh&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=desktop-3&pf_rd_r=1JTBRNDA7E4M58J1VTJS&pf_rd_t=36701&pf_rd_p=2084660942&pf_rd_i=desktop'
		page_html = Nokogiri::HTML.parse(browser.html)
		entry = page_html.css('.a-color-price')
		prices = []
		entry.each do |element|
			html = element.text
			# html.sub!(/\D/, "")
			# p = html.to_f
			# prices << p
			puts html
		end
		# MailgunMailer.protein_notification("#{prices[0]}").deliver
	end
end