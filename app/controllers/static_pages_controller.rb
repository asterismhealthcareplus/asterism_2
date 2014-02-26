class StaticPagesController < ApplicationController
	before_filter :authenticate_user!, only: [:product_status]
	
	def home
	end

	def product_status
	end

	def about_us
	end
end