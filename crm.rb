require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

@@rolodex = Rolodex.new

#temp data 
@@rolodex.add_contact(Contact.new(1000,"NOTES","Will","Richman","Email"))

get '/' do 
	@crm_app_name = "Joseph's world changing CRM"
	erb :index
end

get '/contacts' do
	erb :contacts
end

get 'contacts/:id' do
	contact = @@rolodex.find(1000)
	#erb :show_contact  #file not created yet (<input type= "search")
end

get 'contacts/:id/edit' do
	erb :edit_contact  #file not created yet
end

get '/contacts/new' do
	erb :new_contact
end

get '/contacts/remove' do #file not yet created
	erb :remove_contact
end

post '/contacts' do
	new_contact = Contact.new(params[:id], params[:notes], params[:first_name], params[:last_name], params[:email])
	@@rolodex.add_contact(new_contact)
	redirect to ('/contacts')
end

get "/contacts/1000" do
	@contact = @@rolodex.find(1000)
	erb :show_contact
end
