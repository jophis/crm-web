class Rolodex
	attr_reader :contacts

	def initialize
		@contacts = []
		@id = 1000
	end

	def create_contact(fname, lname, email, notes)
		# contact = Contact.new
		# contact.first_name = fname 
		# contact.last_name = lname
		# contact.email = email
		# contact.notes = notes
		contact.id = @id
		@contacts << contact
	end

	def show_contacts
		@contacts.each do |contact|
			puts contact
		end
	end

	def display_particular_contact(id)
		@contacts.each do |contact|
			if contact.id == id
			puts contact
			end
		end
	end

	def display_attribute(attribute)

		# observation: the code is repeated and the only thing that
		# changes is the attribute

		# attribute is of type: String


		if attribute == "first name"
			@contacts.each do |contact|
				puts contact.first_name
			end
		elsif attribute == "last name"
			@contacts.each do |contact|
				puts contact.last_name
			end	
		elsif attribute == "email"
			@contacts.each do |contact|
				puts contact.email
			end
		elsif attribute == "notes"
			@contacts.each do |contact|
				puts contact.notes
			end
		end
	end

	def remove_contact(id)
		@contacts.delete_if {|c| c.id == id}
	end 

	def edit_contact(id, att_mod, new_att)
		if att_mod == "first name"
			@contacts.each do |contact|
				if contact.id == id
					contact.first_name = new_att
				end
			end
		elsif att_mod == "last name"
			@contacts.each do |contact|
				if contact.id == id
					contact.last_name = new_att
				end
			end	
		elsif att_mod == "email"
			@contacts.each do |contact|
				if contact.id == id
					contact.email = new_att
				end
			end
		elsif att_mod == "notes"
			@contacts.each do |contact|
				if contact.id == id
					contact.notes = new_att
				end
			end
		end
	end
end