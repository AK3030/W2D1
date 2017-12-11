class Employee
  attr_accessor :boss, :salary

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss = nil, employees = [])
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    total_sal = 0
    @employees.each do |employee|
      total_sal += employee.salary
    end
    total_sal * multiplier

  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

ned.employees = [darren, shawna, david]
darren.employees = [shawna, david]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
