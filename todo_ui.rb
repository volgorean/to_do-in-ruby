require './lib/Lists'

@lists = []

def main_menu
  puts "  Commands  "
  puts "****************************************"
  puts "* n - new list                         *"
  puts "* m - modify a list                    *"
  puts "* x - exit                             *"
  puts "****************************************"
  main_choice = gets.chomp
  if main_choice == 'n'
    new_list
  elsif main_choice == 'm'
    modify_list
  elsif main_choice == 'x'
    puts "Goodbye!"
  else
    puts "THAT IS NOT A COMMAND"
    main_menu
  end
end

def modify_list
  @lists.each_with_index do |category, index|
    puts "#{(index+1)}: " + category.category_name
  end
  puts "Enter the number of the list you want to modify"
  @list_to_modify = @lists[gets.chomp.to_i - 1]
  main_menu_task(@list_to_modify)
end

def new_list
  puts "enter a list name: "
  @user_category = List.new(gets.chomp)
  @lists << @user_category
  @list_to_modify = @lists.last
  main_menu_task(@list_to_modify)
end

def main_menu_task(list)
  system('clear')
  @list_to_modify.tasks_list
  puts "\n             Commands  "
  puts "****************************************"
  puts "* a - new task                         *"
  puts "* d - delete task                      *"
  puts "* l - list all tasks                   *"
  puts "* m - modify task                      *"
  puts "* r - return to main menu              *"
  puts "* x - exit                             *"
  puts "****************************************"
  main_choice = gets.chomp
  if main_choice == 'a'
    add_task(@list_to_modify)
  elsif main_choice == 'd'
    delete_task(@list_to_modify)
  elsif main_choice =='l'
    list_task(@list_to_modify)
    main_menu_task(@list_to_modify)
  elsif main_choice == 'm'
    modify_task(@list_to_modify)
  elsif main_choice == 'r'
    main_menu
  elsif main_choice == 'x'
    puts "Goodbye!!!!!"
  else
    puts "NOT A VALID ENTRY, Please follow the directions"
    main_menu_task(@list_to_modify)
  end
end

def add_task(list)
  puts "enter the task description"
  user_description = gets.chomp
  puts "what is the priority of your task 1-5"
  @user_priority = gets.chomp.to_i
  puts "what is the due date (YYYYMMDD)"
  @user_date = gets.chomp.to_i
  @list_to_modify.add_task(user_description, @user_priority, @user_date)
  puts "Task added. \n\n"
  main_menu_task(@list_to_modify)
end

def delete_task(list)
  @list_to_modify.tasks_list
  puts "enter a task number to delete"
  user_input = gets.chomp.to_i
  @list_to_modify.remove(user_input-1)
  puts "\n\n\n\n\n\n*************UPDATED LIST***************"
  @list_to_modify.tasks_list
  main_menu_task(@list_to_modify)
end

def list_task(list)
  @list_to_modify.tasks_list
  puts "Press 'd' to organize by date, 'p' to organize by priority or 'x' to exit
  to the prior menu"
  organize_by = gets.chomp
  if organize_by == 'd'
    @list_to_modify.sort_by_date
    system("clear")
    @list_to_modify.tasks_list
  elsif organize_by == 'p'
    @list_to_modify.sort_by_priority
    system("clear")
    @list_to_modify.tasks_list
  elsif organize_by == 'x'
    main_menu_task(@list_to_modify)
  else
    puts "YOU FAIL"
    list_task(@list_to_modify)

  end

end
main_menu











