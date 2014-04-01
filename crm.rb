require_relative 'contact'
require 'sinatra'

get '/' do 
	@crm_app_name = "Joseph's world changing CRM"
	erb :index
end

get '/contacts' do
	@contacts = []
	@contacts << Contact.new("1001", "note1", "Julie", "Hache", "julie@bitmakerlabs.com")
	@contacts << Contact.new("1002", "note2", "Will", "Richman", "will@bitmakerlabs.com")
	@contacts << Contact.new("1003", "note3", "Chris", "Johnston", "chris@bitmakerlabs.com")

	erb :contacts

end

get '/contacts/new' do

end

get 'contacts/:id' do

end

get 'contacts/:id/edit' do

end

