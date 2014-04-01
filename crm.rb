require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

@@rolodex = Rolodex.new

get '/' do 
	@crm_app_name = "Joseph's world changing CRM"
	erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do

end

get 'contacts/:id' do

end

get 'contacts/:id/edit' do

end

