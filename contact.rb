#web version
class Contact
	
	attr_accessor :id, :notes, :first_name, :last_name, :email 

	@@counter = 1000
	
	def initialize
		@id = Contact.get_id
	end

	def to_s
		"ID: #{@id}\nFirst Name: #{@first_name}\nLast Name: #{@last_name}\nEmail: #{email} \nNotes #{@notes}"
	end

	def self.get_id
		@@counter += 1
		@@counter
	end

end
