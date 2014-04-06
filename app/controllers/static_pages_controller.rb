class StaticPagesController < ApplicationController
	before_filter :authenticate_user!, only: [:product_status]
	require 'open-uri'


	
	def home
	end

	def product_status
		@alldonet_product_list = JSON.load(open('https://trm-dot-alldonetutils.appspot.com/c/asterism/prodlist/?u=asterismui&pw=foobar'))
		@product_list_count = @alldonet_product_list.count
		alldonet_current_user_prod = JSON.load(open("https://trm-dot-alldonetutils.appspot.com/c/asterism/revokeuser/?aid=#{current_user.id}&pk=none&u=asterismui&pw=foobar"))
		@product_desc_part_1 = "https://trm-dot-alldonetutils.appspot.com/c/asterism/getprod/?pk="
		@product_desc_part_2 = "&u=asterismui&pw=foobar"
		@approved_prod = []
		if !alldonet_current_user_prod['urls'].nil?
			alldonet_current_user_prod['urls'].each do |url|
				@approved_prod << url.gsub("=", " ").split.last.to_i
			end
		end
	end

	def about_us
	end

	def all_users
		@users = User.all
		unless current_user.admin? or current_user.employee?
			redirect_to root_path
			flash[:error] = 'You do not have the proper permission level to view that page'
		end
	end

	def command_center
		@alldonet_product_list = JSON.load(open('https://trm-dot-alldonetutils.appspot.com/c/asterism/prodlist/?u=asterismui&pw=foobar'))
		@users = User.all
		unless current_user.admin? or current_user.employee?
			redirect_to root_path
			flash[:error] = 'You do not have the proper permission level to view that page'
		end
	end

	def contact
	end
		
end