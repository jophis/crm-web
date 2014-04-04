require_relative 'rolodex'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

#routes here

class Contact
	include DataMapper::Resource

	property :id, Serial
	property :first_name, String
	property :last_name, String
	property :email, String
	property :notes, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

	
# 	attr_accessor :id, :notes, :first_name, :last_name, :email 

# 	@@counter = 1000
	
# 	def initialize(notes, first_name, last_name, email)
# 		@id = @@counter
# 		@notes = notes
# 		@first_name = first_name
# 		@last_name = last_name
# 		@email = email

# 		@@counter += 1
# 	end
# end


@@contact_to
@@rolodex = Rolodex.new

get '/' do 
	@crm_app_name = "Joseph's world changing CRM"
	erb :index
end

get '/contacts' do
	@contacts = Contact.all
	erb :contacts
end

get '/contacts/:id/edit' do
	@contact = Contact.get(params[:id].to_i)
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
	@contacts = []
	if params[:last_name]
		@contacts = Contact.all(last_name: params[:last_name])


		# if they provided search criteria, find the MATCHING contact(s) from @@rolodex.contacts
		# and return all the results. This could be from zero to many. 
		# "find the matching contacts that have the same last name"

		 # this is the result of the search, not the full rolodex 		
	end

	erb :search_contact
end

get '/contacts/:id' do
	@contact = Contact.get(params[:id].to_i)
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
	contact = Contact.create(
		:first_name => params[:first_name],
		:last_name => params[:last_name],
		:email => params[:email],
		:notes => params[:notes]
	)
	redirect to ('/contacts/new')
end

# 	new_contact = Contact.new(params[:notes], params[:first_name], params[:last_name], params[:email])
# 	@@rolodex.add_contact(new_contact)
# 	redirect to ('/contacts/new')
# end

put "/contacts/:id" do
	@contact = Contact.get(params[:id].to_i)
	if @contact
		@contact.first_name= params[:first_name]
		@contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.notes = params[:notes]

    redirect to ("/contacts")

  else
  	raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
	@contact = Contact.get(params[:id].to_i)
  if @contact
  	@contact.destroy
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end
