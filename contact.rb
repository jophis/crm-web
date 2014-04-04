#web version
class Contact
	
	attr_accessor :id, :notes, :first_name, :last_name, :email 

	@@counter = 1000
	
	def initialize(notes, first_name, last_name, email)
		@id = @@counter
		@notes = notes
		@first_name = first_name
		@last_name = last_name
		@email = email

		@@counter += 1
	end
end
