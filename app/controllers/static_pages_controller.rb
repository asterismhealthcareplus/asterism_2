class StaticPagesController < ApplicationController
	before_filter :authenticate_user!, only: [:product_status]
	require 'open-uri'
	
	def home
	end

	def product_status
		@alldonet_product_list = JSON.load(open('https://trm-dot-alldonetweb.appspot.com/c/asterism/prodlist/?u=asterismui&pw=foobar'))
		@product_list_count = @alldonet_product_list.count
		def product_name
			@alldonet_product_list.each do |product|
				product[0..@product_list_count]['pn']
			end
		end
	end

	def about_us
	end

	def all_users
		@users = User.all
	end
end