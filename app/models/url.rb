require	'securerandom'

class Url < ApplicationRecord
	
	validates :long_url, presence: true, uniqueness: true
	validates :short_url, presence: true, uniqueness: true
	validates_format_of :long_url, :with => /([A-Za-z0-9]{3,50}\.[A-Za-z0-9]{2,5}.*)|(https:\/\/[A-Za-z0-9]{3,50}\.[A-Za-z0-9]{2,3}.*)|(http:\/\/[A-Za-z0-9]{3,50}\.[A-Za-z0-9]{2,3}.*)/i

	# before_save :shorten

	# def shortenlink

	# end

	def shorten
	
		self.short_url = SecureRandom.urlsafe_base64(4)
	end

	def counter
		self.click_count += 1
	end



	def original_url= url_str
	  unless url_str.blank?
	    unless url_str.split(':')[0] == 'http' || url_str.split(':')[0] == 'https'
	        url_str = "http://" + url_str
	    end
	  end  
	  write_attribute :long_url, url_str
	end

end

