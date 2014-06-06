class CRM
	attr_reader :name

	def initialize(potato) #object now has its own personal value
		@name = potato
	end

	def print_main_menu
		puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Delete a contact"
	  puts "[4] Display all the contacts"
	  puts "[5] Display an attribute"
	  puts "[6] Exit"
	  puts "Enter a number: "
	end

	def main_menu
		puts "Welcome to #{@name}"
		print_main_menu
	  selection = gets.chomp.to_i
		call_option(selection)
	end

	def call_option(selection)
		case selection
		when 1 then add_new_contact
		when 2 then modify_contact
		when 3 then delete_contact
		when 4 then modify_contact
		when 5 then display_contacts
		when 6
			puts "Goodbye"
			exit_crm
		else 
			puts "Invalid option. Please try again"
			main_menu
		end
	end
end

crm = CRM.new("Bitmaker Labs CRM")
crm.main_menu