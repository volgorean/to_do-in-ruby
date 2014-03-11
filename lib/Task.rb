class Task
  def initialize(description, task_priority, date)
    @description = description
    @task_priority = task_priority
    @date = date
  end

  def description
    @description
  end

  def priority
    @task_priority
  end

  def date
    @date
  end
end



