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
    @tasks.each_with_index do |task, index|
      puts "#{(index+1)}: " + task.description
    end
  end

  def add_task(description)
    new_task = Task.new(description)
    @tasks << new_task
  end

  def remove(index)
    @tasks.delete_at(index)
  end

end
