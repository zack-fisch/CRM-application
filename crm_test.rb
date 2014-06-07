class CRM
	require_relative "contact"
	require_relative "Rolodex"

	def initialize
		@rolodex = Rolodex.new
	end

	def print_main_menu
		puts "============================================="
		puts "[1] Add a new contact"
		puts "[2] Modify an existing contact"
		puts "[3] Delete a contact"
		puts "[4] Display all the contacts"
		puts "[5] Display a specific contact"
		puts "[6] Display specific attribute"
		puts "[7] Exit"
		puts "============================================="
		puts "Enter a command: "
	end

	def main_menu
		print_main_menu
		user_selected  = gets.chomp
		if user_selected.downcase == "no"
			main_menu
		else
			user_selected = user_selected.to_i
			call_option(user_selected)
		end
	end

	def call_option(user_selected)
		add_new_contact if user_selected == 1
		modify_existing_contact if user_selected == 2
		delete_contact if user_selected == 3
		display_contacts if user_selected == 4
		display_contact if user_selected == 5
		display_attribute if user_selected == 6
		exit_program if user_selected == 7
	end

	def add_new_contact 
		puts "Please enter first name"
		first_name = gets.chomp
		puts "Please enter last name"
		last_name = gets.chomp
		puts "Please enter email"
		email = gets.chomp
		puts "Please enter note"
		note = gets.chomp
		contact = Contact.new(first_name, last_name, email, note)
		puts "============================================="
		puts "Contact at ID " + @rolodex.id.to_s + " successfully added." 
		puts "============================================="
		@rolodex.add_contact(contact)
		main_menu
	end

	def modify_existing_contact
		puts "Enter ID of contact to edit"
		selected_id = gets.chomp.to_i
		modify_contact = @rolodex.search(selected_id)
		puts "New First Name"
		new_first_name = gets.chomp
		modify_contact.first_name = new_first_name
		puts "New Last Name"
		new_last_name = gets.chomp
		modify_contact.last_name = new_last_name
		puts "New email"
		new_email = gets.chomp
		modify_contact.email = new_email
		puts "New Note"
		new_note = gets.chomp
		modify_contact.note = new_note
		puts "============================================="
		puts "Contact at ID: " + selected_id.to_s + " has been altered."
		puts "============================================="
		main_menu
	end	

	def display_contacts
		@rolodex.contacts.each do 
			|contact_info| 
			puts "============================================="
			puts "Contact First Name: " + contact_info.first_name
			puts "Contact Last Name: " + contact_info.last_name
			puts "Contact Email: " + contact_info.email
			puts "Contact Note: " + contact_info.note
			puts "============================================="
		end
		main_menu
	end

	def delete_contact
		puts "Enter ID of contact to delete."
		selected_id = gets.to_i
		delete_contact = @rolodex.search(selected_id)
		@rolodex.contacts.delete(delete_contact)
		puts "Contact at ID #{selected_id} deleted."
		puts "============================================="
		main_menu
	end

	def display_contact 
		puts "Please enter ID of contact to display"
		display_id = gets.to_i
		display_contact = @rolodex.contacts.find{|contact| contact.id == display_id}
		if display_contact != nil 
			puts "============================================="
			puts "Contact First Name: " + display_contact.first_name
			puts "Contact Last Name: " + display_contact.last_name
			puts "Contact Email: " + display_contact.email
			puts "Contact Note: " + display_contact.note
			puts "============================================="
			main_menu
		else
			main_menu
		end
 end

 	def exit_program
 		puts "Thank you for using CLI CRM!"
 	end

	def self.run #(name) #class method, call this on CRM
		crm = CRM.new #(name) #creates new instance of CRM
		crm.main_menu
	end

end

CRM.run
