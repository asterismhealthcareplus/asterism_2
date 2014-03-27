class StaticPagesController < ApplicationController
	before_filter :authenticate_user!, only: [:product_status]
	require 'open-uri'


	
	def home
	end

	def product_status
		@alldonet_product_list = JSON.load(open('https://trm-dot-alldonetutils.appspot.com/c/asterism/prodlist/?u=asterismui&pw=foobar'))
		@product_list_count = @alldonet_product_list.count
		@product_desc_part_1 = "https://trm-dot-alldonetutils.appspot.com/c/asterism/getprod/?pk="
		@product_desc_part_2 = "&u=asterismui&pw=foobar"
	end

	def about_us
	end

	def all_users
		@users = User.all
		if current_user.admin == false
			redirect_to root_path
		end
	end
end