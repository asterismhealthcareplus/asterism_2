class StaticPagesController < ApplicationController
	before_filter :authenticate_user!, only: [:order_status]
	
	def home
	end

	def order_status
	end
end