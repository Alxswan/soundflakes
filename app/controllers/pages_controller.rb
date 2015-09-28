class PagesController < ApplicationController
	def home
	require 'soundcloud'

		# create client object with app credentials
		client = Soundcloud.new(:client_id => 'dea3c2dce5d40ad0ee8ef7c8275d8dd5',
		                        :client_secret => 'f0f3ab23df891dce7fadd9f9c9a45a0d',
		                        :redirect_uri => 'http://localhost:3000/callback')

		# redirect user to authorize URL
		redirect_to client.authorize_url()

	end

	def callback
			# create client object with app credentials
		client = Soundcloud.new(:client_id => 'dea3c2dce5d40ad0ee8ef7c8275d8dd5',
		                        :client_secret => 'f0f3ab23df891dce7fadd9f9c9a45a0d',
		                        :redirect_uri => 'http://localhost:3000/callback')

		# exchange authorization code for access token
		code = params[:code]
		access_token = client.exchange_token(:code => code)
		
		# get a tracks oembed data
		track_url = 'https://api.soundcloud.com/tracks/220068021'
		embed_info = client.get('/oembed', :url => track_url)

		# print the html for the player widget
		@embed = embed_info['html']
		binding.pry
	end
end
