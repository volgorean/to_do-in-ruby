require "Task"
require "Lists"
require "rspec"

describe Task do
  it "makes an instance of task" do
    new_task = Task.new("eat lots of cake", 1, 20131014)
    new_task.should be_an_instance_of Task
  end
  it "lets you read the description out" do
    new_task = Task.new("eat some more cake", 1, 20131014)
    new_task.description.should eq "eat some more cake"
  end
  it "lets you read the priority out" do
    new_task = Task.new("eat some more cake", 1, 20131014)
    new_task.priority.should eq 1
  end
  it "lets you read the priority out" do
    new_task = Task.new("eat some more cake", 1, 20131014)
    new_task.date.should eq 20131014
  end
end

describe List do
  it "creates a new instance of List" do
    new_list = List.new("Chores")
    new_list.should be_an_instance_of List
  end

  it "creates new instances of task within List" do
    new_list = List.new("Chores")
    new_list.add_task("Wash the dishes", 4, 20121234)
    new_list.tasks_list[0].description.should eq "Wash the dishes"
  end

  it "removes a task" do
    new_list = List.new("Peter Poops")
    new_list.add_task("Wash the dishes", 4, 20121234)
    new_list.remove(0)
    @task.should eq nil
  end

  # it "sorts the elements by date" do
  #   new_list = List.new("Sports")
  #   new_list.add_task("Wash the dishes", 4, 20121234)
  #   new_list.add_task("Eat a cake", 5, 20140312)
  #   new_list.sort_by_date.should eq "something"

  # end
end
