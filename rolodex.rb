class Rolodex
	attr_reader :id ,:contacts
	def initialize
		@contacts = []
		@id = 1000
	end

	def contacts
		@contacts
	end

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end

	def search(id)
		#@contacts.each {|contact| return contact if contact.id == id}	
		found_contact = @contacts.find {|contact| contact.id == id}	 #Need further explanation
		return found_contact
	end

end

