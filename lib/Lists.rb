require "./lib/Task"

class List
  def initialize(category)
    @category = category
    @tasks = []
  end

  def category_name
    @category
  end

  def tasks_list
    puts "   Name/Priority/Date"
    @tasks.each_with_index do |task, index|
      puts "#{(index+1)}: " + task.description + "/#{task.priority}"
    end
  end

  def add_task(description, priority)
    new_task = Task.new(description, priority)
    @tasks << new_task
  end

  def remove(index)
    @tasks.delete_at(index)
  end

  def sort_by_priority
    @tasks.sort!{|x, y| y.priority <=> x.priority}
  end
end
