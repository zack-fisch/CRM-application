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
	print_main_menu
  selection = gets.chomp.to_i
	# call_option(selection)
end

def call_option(selection)
	add_new_contact if selection == 1
	modify_contact if selection == 2
	delete_contact if selection == 3
	display_contacts if selection == 4
	display attribute if selection == 5
	exiit_crm if selection == 6
end

main_menu