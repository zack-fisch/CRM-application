class Rolodex
	def initialize
		@contacts = []
		@contact_id = 1000 #everytime new contact added to DB, contact pushed into array, will also give it particular identifier
	end

	def add_contact(contact)
		@contacts << contact
		contact.id = @contact_id
		@contact.id += 1
	end
end