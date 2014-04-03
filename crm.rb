require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'


@@contact_to
@@rolodex = Rolodex.new

get '/' do 
	@crm_app_name = "Joseph's world changing CRM"
	erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/:id/edit' do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		erb :edit_contact
	else 
		raise Sinatra::NotFound
	end
end

get '/contacts/new' do
	erb :new_contact
end

get '/contacts/search' do
	@list = []
	if params[:last_name]
		@contact = @@rolodex.find(params[:last_name])

		@list << @contact

		# if they provided search criteria, find the MATCHING contact(s) from @@rolodex.contacts
		# and return all the results. This could be from zero to many. 
		# "find the matching contacts that have the same last name"

		@list  # this is the result of the search, not the full rolodex 		
	end

	erb :search_contact
end

get '/contacts/:id' do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

get '/contacts/remove' do #file not yet created
	erb :remove_contact
end

post '/contacts' do
	new_contact = Contact.new(params[:notes], params[:first_name], params[:last_name], params[:email])
	@@rolodex.add_contact(new_contact)
	redirect to ('/contacts/new')
end



