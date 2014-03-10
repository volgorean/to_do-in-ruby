require "Task"
require "Lists"
require "rspec"

describe Task do
  it "makes an instance of task" do
    new_task = Task.new("eat lots of cake")
    new_task.should be_an_instance_of Task
  end
  it "lets you read the description out" do
    new_task = Task.new("eat some more cake")
    new_task.description.should eq "eat some more cake"
  end
end

describe List do
  it "creates a new instance of List" do
    new_list = List.new("Chores")
    new_list.should be_an_instance_of List
  end

  it "creates new instances of task within List" do
    new_list = List.new("Chores")
    new_list.add_task("Wash the dishes")
    new_list.tasks_list[0].description.should eq "Wash the dishes"
  end
end
