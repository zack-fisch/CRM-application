class CRM
	require_relative "contact"
	require_relative "Rolodex"

	def initialize(name_passed)
		@name = name_passed
		@rolodex = Rolodex.new
	end

	def print_main_menu
		puts "[1] Add a new contact"
		puts "[2] Modify an existing contact"
		puts "[3] Delete a contact"
		puts "[4] Display all the contacts"
		puts "[5] Display an attribute"
		puts "[6] Exit"
		puts "Enter a command: "
	end

	def main_menu
		print_main_menu
		user_selected  = gets.chomp
		if user_selected.downcase == "no"
			main_menu
		elsif user_selected.downcase == "display all"
			p @rolodex.contacts #Come back to this to see if there is a better way to format output
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
		display_attribute if user_selected == 5
		exit_program if user_selected == 6
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
		contact = Contact.new(first_name, last_name, email ,note)
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

		puts modify_contact.first_name + " has been modified"
	end	

	def self.run(name) #class method, call this on CRM
		crm = CRM.new(name) #creates new instance of CRM
		crm.main_menu
	end

end

CRM.run("Hello Zack")
