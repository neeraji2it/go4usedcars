class HomesController < ApplicationController
	def index
		render layout: false
	end

	def home
	end

	def about_us
	end

	def buy_car
	end

	def sell_car
	end

	def auto_finance
	end

	def insurance
	end

	def contact_us
	end

	def faq
	end

	def testimonial
    @testimonial = Testimonial.new
	end

	def careers
		@career = Career.new
	end

	def contact_us
	end

	def associates_partners
	end
end