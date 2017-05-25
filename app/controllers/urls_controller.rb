class UrlsController < ApplicationController
	def index
		@urls = Url.all
	end

	def show
    	@url = Url.find(params[:id])
	end

	def new
  		@url = Url.new
	end

	def create
	  @url = Url.new(params[:url])
	  @url.shorten
	  if @url.save
	      redirect_to @url  
	  else
	      render 'new'
	  end   
	end
end
